class Link < Post
    def to_db_hash
        super.merge({ url: @url })
    end

    def load_data(hash)
        super(hash)
        @url = hash[:url]
    end

    def to_strings
        lines = []
        lines << "Ссылка: #{@url}"
        lines << super
    end

    def read_from_console
        puts 'Введите адрес ссылки'
        @url = $stdin.gets.chomp

        puts 'Напишите пару слов о том, куда ведёт ссылка'
        @content << $stdin.gets.chomp
    end
end
