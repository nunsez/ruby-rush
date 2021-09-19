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
end
