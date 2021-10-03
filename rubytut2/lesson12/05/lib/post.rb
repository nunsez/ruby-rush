require 'pg'

class Post
    class << self
        def post_types
            { 'Memo' => Memo, 'Task' => Task, 'Link' => Link }
        end

        def create(type)
            post_types[type].new
        end

        def conn_init
            conn = PG.connect(dbname: 'ruby_rush')
            conn.type_map_for_results = PG::BasicTypeMapForResults.new(conn)
            conn.field_name_type = :symbol
            conn
        end

        def find_by_id(id)
            return if id.nil?

            conn = conn_init
            result = conn.exec("SELECT * FROM posts WHERE id = #{id}").first

            return if result.nil?

            post = create(result[:type])
            post.load_data(result)
            post
        rescue PG::Error => e
            puts 'Не удалось выполнить запрос в базе.'
            puts e.message
            exit
        end

        def find_all(params)
            conn = conn_init

            query =     'SELECT * FROM posts '
            query <<    "WHERE type = '#{params[:type]}' " if params[:type]
            query <<    'ORDER BY id DESC '
            query <<    "LIMIT #{params[:limit]} " if params[:limit]

            conn.exec(query) # return result
        rescue PG::Error => e
            puts 'Не удалось выполнить запрос в базе.'
            puts e.message
            exit
        end

        def date_fmt(date)
            return '' if date.nil?

            date.strftime('%d.%m.%y %H:%M')
        end
    end

    def initialize
        @content = []
        @created_at = Time.now
        @updated_at = Time.now
    end

    def read_from_console = (raise NotImplementedError)

    def to_strings
        lines = []
        lines << 'Содержимое:'
        lines << @content << ''
        lines << "Дата изменения: #{self.class.date_fmt(@updated_at)}"
        lines << "Дата создания: #{self.class.date_fmt(@created_at)}"
    end

    def to_db_hash
        {
            type: self.class.name,
            content: @content.join("\n"),
            created_at: @created_at,
            updated_at: @updated_at
        }
    end

    def save_to_db
        conn = self.class.conn_init
        hash = to_db_hash
        params = []

        1.upto(hash.size) { |i| params << "$#{i}" }

        res = conn.exec(
            "INSERT INTO posts (#{hash.keys.join(', ')})
             VALUES (#{params.join(', ')})
             RETURNING id",
            hash.values
        )

        res.first[:id]
    rescue PG::Error => e
        puts 'Не удалось выполнить запрос в базе.'
        puts e.message
        exit
    end

    def load_data(hash)
        @content = hash[:content].split('\n')
        @created_at = hash[:created_at]
        @updated_at = hash[:updated_at]
    end
end
