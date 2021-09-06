class Person
    def initialize(first_name, middle_name, age)
        @first_name = first_name
        @middle_name = middle_name
        @age = age
    end

    def full_name
        if old?
            puts "#{@first_name} #{@middle_name}"
        else
            puts @first_name.to_s
        end
    end

    def old?
        @age > 60
    end

    attr_reader :age

    def age_s
        old? ? 'пожилой' : 'молодой'
    end
end
