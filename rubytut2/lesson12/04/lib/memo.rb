class Memo < Post
    def read_from_console
        puts 'Я сохраню всё, что ты напишешь до строчки "end" в файл.'

        line = nil

        while line != 'end'
            line = $stdin.gets.encode('utf-8').chomp
            @content << line
        end

        @content.pop
    end
end
