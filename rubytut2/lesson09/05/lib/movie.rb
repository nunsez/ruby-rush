class Movie < Product
    def initialize(params)
        super

        @title = params[:title]
        @year = params[:year]
        @director_name = params[:director_name]
    end

    def update(params)
        super

        @title = params[:title] if params.key?(:title)
        @year = params[:year] if params.key?(:year)
        @director_name = params[:director_name] if params.key?(:director_name)
    end

    def info
        "Фильм «#{@title}», реж. #{@director_name} (#{@year})"
    end

    def read_from_console
        puts
        puts 'Укажите название фильма'
        @title = $stdin.gets.encode('utf-8').chomp

        puts
        puts 'Укажите имя режиссёра'
        @director_name = $stdin.gets.encode('utf-8').chomp

        puts
        puts 'Укажите год выхода фильма'
        @year = $stdin.gets.to_i
    end

    def to_xml
        product = super

        product.add_element(
            'movie',
            'title' => @title,
            'director_name' => @director_name,
            'year' => @year
        )
        product
    end
end
