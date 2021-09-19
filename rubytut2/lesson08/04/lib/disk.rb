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
end
