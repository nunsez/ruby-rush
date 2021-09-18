class Film < Product
    attr_accessor :title, :year, :director

    class << self
        def from_file(file_path)
            lines = File.readlines(file_path, encoding: 'utf-8', chomp: true, autoclose: true)

            new(
                title: lines[0],
                director: lines[1],
                year: lines[2].to_i,
                price: lines[3].to_i,
                amount: lines[4].to_i
            )
        rescue SystemCallError
            puts 'Film data not found!'
        end
    end

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
