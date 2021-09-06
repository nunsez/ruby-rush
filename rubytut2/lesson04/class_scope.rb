variable = 'local variable'

class MyClass
    def initialize
        @variable = 'class variable'
    end

    def check_variables
        puts 'В классе:'
        puts "variable: #{defined?(variable)}"
        puts "@variable: #{defined?(@variable)}"
    end
end

instance = MyClass.new
instance.check_variables
puts

puts 'Вне класса:'
puts "variable: #{defined?(variable)}"
puts "@variable: #{defined?(@variable)}"
