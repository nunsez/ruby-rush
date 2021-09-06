class BodyBuilder
    def initialize
        @biceps = 0
        @triceps = 0
        @deltoid = 0
    end

    def pump(muscle)
        case muscle
        when 'Бицепсы'
            @biceps += 1
        when 'Трицепсы'
            @triceps += 1
        when 'Дельтовидка'
            @deltoid += 1
        end
    end

    def show_muscles
        puts "Бицепсы: #{@biceps}"
        puts "Трицепсы: #{@triceps}"
        puts "Дельтовидка: #{@deltoid}"
    end
end
