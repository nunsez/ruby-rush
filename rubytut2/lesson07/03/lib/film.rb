class Film < Product
    attr_accessor :title, :year, :director

    class << self
        def from_file(file_path)
            begin
                content = File.readlines(file_path, encoding: 'utf-8', chomp: true)

                new(
                    title: content[0],
                    director: content[1],
                    year: content[2].to_i,
                    price: content[3].to_i,
                    amount: content[4].to_i
                )
            rescue SystemCallError
                puts 'Film data not found!'
            end
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
