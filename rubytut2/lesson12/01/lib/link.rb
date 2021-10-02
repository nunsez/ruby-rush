class Link < Post
    def to_db_hash
        super.merge({ url: @url })
    end

    def load_data(hash)
        super(hash)
        @url = hash[:url]
    end

    def to_strings
        lines = []
        lines << "Ссылка: #{@url}"
        lines << super
    end
end
