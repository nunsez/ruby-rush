class Task < Post
    def to_db_hash
        super.merge({ due_date: @due_date })
    end

    def load_data(hash)
        super(hash)
        @due_date = hash[:due_date]
    end

    def to_sstrings
        lines = []
        lines << "Дата истечения: #{@due_date}"
        lines << super
    end
end
