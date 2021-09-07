require 'date'

class Task < Post
    def initialize
        super

        @due_date = ''
    end

    def read_from_console
        puts 'Что вам необходимо сделать?'
        @text = $stdin.gets.encode('utf-8').chomp

        puts 'До какого числа вам нужно это сделать?'
        puts 'Укажите дату в формате ДД.ММ.ГГГГ, например 12.05.2003'
        input = $stdin.gets.chomp

        @due_date = Date.parse(input)
    end

    def save
        file = File.open(file_path, 'w:utf-8')
        time_string = @created_at.strftime('%Y.%m.%d, %H:%M')

        file.puts time_string
        file.puts "Сделать до #{@due_date.strftime('%Y.%m.%d')}"
        file.puts @text

        file.close

        puts 'Ваша задача сохранена'
    end
end
