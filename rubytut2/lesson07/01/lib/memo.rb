class Memo < Post
    def read_from_console
        puts 'Я сохраню всё, что ты напишешь до строчки "end" в файл.'

        line = nil

        while line != 'end'
            line = $stdin.gets.encode('utf-8').chomp
            @text << line
        end

        @text.pop
    end

    def save
        file = File.open(file_path, 'w:utf-8')
        time_string = @created_at.strftime('%Y.%m.%d, %H:%M')

        file.puts time_string

        @text.each do |line|
            file.puts line
        end

        file.close

        puts 'Ваша запись сохранена'
    end
end
