class Bridge
    def initialize
        puts 'Мост создан'
        @opened = false
    end

    def open
        @opened = true
        puts 'Мост открыт, можно ехать'
    end

    def open?
        @opened
    end
end
