class Book < Product
    def initialize(params)
        super

        @title = params[:title]
        @author_name = params[:author_name]
    end

    def update(params)
        super

        @title = params[:title] if params.key?(:title)
        @author_name = params[:author_name] if params.key?(:author_name)
    end

    def info
        "Книга «#{@title}», автор: #{@author_name}"
    end
end
