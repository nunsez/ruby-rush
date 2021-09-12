class Film < Product
    attr_accessor :title, :year, :director

    def initialize(params)
        super

        @title = params[:title]
        @year = params[:year]
        @director = params[:director]
    end

    def update(params)
        super

        @title = params[:title] if params.key?(:title)
        @year = params[:year] if params.key?(:year)
        @director = params[:director] if params.key?(:director)
    end

    def to_s
        "Фильм «#{title}», #{year}, реж. #{director}, #{super}"
    end
end
