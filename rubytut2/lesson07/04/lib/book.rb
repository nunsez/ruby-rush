class Book < Product
    attr_accessor :title, :genre, :author

    class << self
        def from_file(file_path)
            lines = File.readlines(file_path, encoding: 'utf-8', chomp: true, autoclose: true)

            new(
                title: lines[0],
                genre: lines[1],
                author: lines[2],
                price: lines[3].to_i,
                amount: lines[4].to_i
            )
        rescue SystemCallError
            puts 'Book data not found!'
        end
    end

    def initialize(params)
        super

        @title = params[:title]
        @genre = params[:genre]
        @author = params[:author]
    end

    def update(params)
        super

        @title = params[:title] if params.key?(:title)
        @genre = params[:genre] if params.key?(:genre)
        @author = params[:author] if params.key?(:author)
    end

    def to_s
        "Книга «#{title}», #{genre}, автор — #{author}, #{super}"
    end
end
