class Link < Post
    def initialize
        super

        @url = ''
    end

    def read_from_console
        puts 'Введите адрес ссылки'
        @url = $stdin.gets.chomp

        puts 'Напишите пару слов о том, куда ведёт ссылка'
        @text = $stdin.gets.chomp
    end

    def save
        file = File.open(file_path, 'w:utf-8')
        time_string = @created_at.strftime('%Y.%m.%d, %H:%M')

        file.puts time_string
        file.puts @url
        file.puts @text
        file.close

        puts 'Ваша ссылка сохранена'
    end
end
