class Book < Product
    attr_accessor :title, :genre, :author

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
