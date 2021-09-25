class Disk < Product
    def initialize(params)
        super

        @album_name = params[:album_name]
        @artist_name = params[:artist_name]
        @genre = params[:genre]
    end

    def update(params)
        super

        @album_name = params[:album_name] if params.key?(:album_name)
        @artist_name = params[:artist_name] if params.key?(:artist_name)
        @genre = params[:genre] if params.key?(:genre)
    end

    def info
        "Диск #{@artist_name} — #{@album_name} (#{@genre})"
    end

    def read_from_console
        puts
        puts 'Укажите название исполнителя'
        @artist_name = $stdin.gets.encode('utf-8').chomp

        puts
        puts 'Укажите название альбома'
        @album_name = $stdin.gets.encode('utf-8').chomp

        puts
        puts 'Укажите музыкальный жанр'
        @genre = $stdin.gets.encode('utf-8').chomp
    end

    def to_xml
        product = super

        product.add_element(
            'disk',
            'artist_name' => @artist_name,
            'album_name' => @album_name,
            'genre' => @genre
        )
        product
    end
end
