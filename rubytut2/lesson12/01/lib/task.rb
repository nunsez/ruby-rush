class Task < Post
    def to_db_hash
        super.merge({ due_date: @due_date })
    end

    def load_data(hash)
        super(hash)
        @due_date = hash[:due_date]
    end

    def to_strings
        lines = []
        lines << "Дата истечения: #{@due_date}"
        lines << super
    end

    def read_from_console
        puts 'Что вам необходимо сделать?'
        @content << $stdin.gets.encode('utf-8').chomp

        puts 'До какого числа вам нужно это сделать?'
        puts 'Укажите дату в формате ДД.ММ.ГГГГ, например 12.05.2003'
        input = $stdin.gets.chomp

        @due_date = Date.parse(input)
    end
end
