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

    def read_from_console
        puts
        puts 'Укажите название книги'
        @title = $stdin.gets.encode('utf-8').chomp

        puts
        puts 'Укажите автора произведения'
        @author_name = $stdin.gets.encode('utf-8').chomp
    end

    def to_xml
        product = super

        product.add_element(
            'book',
            'title' => @title,
            'author_name' => @author_name
        )
        product
    end
end
