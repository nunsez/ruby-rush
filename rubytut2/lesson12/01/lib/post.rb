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

        def find(params)
            conn = conn_init

            if params[:id].nil?
                query =     'SELECT * FROM posts '
                query +=    "WHERE type = '#{params[:type]}' " if params[:type]
                query +=    'ORDER BY id DESC '
                query +=    "LIMIT #{params[:limit]} " if params[:limit]

                result = conn.exec(query)
                return result.first
            end

            result = conn.exec("SELECT * FROM posts WHERE id = #{params[:id]}")

            if result.any?
                result = result.first
                post = create(result[:type])
                post.load_data(result)
                return post
            end

            puts "Такой id: #{params[:id]} не найден в базе."
            []
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
            created_at: @created_at.to_s,
            updated_at: @updated_at.to_s
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
             RETURNING *;",
            hash.values
        )

        res.first[:id]
    end

    def load_data(hash)
        @content = hash[:content].split('\n')
        @created_at = hash[:created_at]
        @updated_at = hash[:updated_at]
    end

    def save
        File.open(file_path, 'w:utf-8') do |file|
            to_strings.each { |item| file.puts item }
        end
    end

    def file_path
        type = self.class.name
        file_name = @created_at.strftime("#{type}_%Y-%m-%d_%H-%M-%S.txt")
        relative_path = File.join('..', 'data', file_name)
        File.expand_path(relative_path, __dir__)
    end
end
