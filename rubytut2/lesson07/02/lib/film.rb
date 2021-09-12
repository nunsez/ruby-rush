class Film < Product
    attr_reader :title, :year, :director

    def initialize(params)
        super

        @title = params[:title]
        @year = params[:year]
        @director = params[:director]
    end

    def to_s
        "Фильм «#{title}», #{year}, реж. #{director}, #{super}"
    end
end
