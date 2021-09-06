class Person
    def initialize(first_name, middle_name)
        @first_name = first_name
        @middle_name = middle_name
    end

    def full_name
        puts "#{@first_name} #{@middle_name}"
    end
end
