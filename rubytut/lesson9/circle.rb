def get_circle_area(radius)
    radius = 0 if radius.nil? || !radius.is_a?(Numeric)

    3.14159 * radius * radius
end

puts 'Введите радиус круга:'
radius1 = $stdin.gets.to_f
area1 = get_circle_area(radius1)

puts "Площадь круга: #{area1}"

puts 'Введите радиус второго круга:'
radius2 = $stdin.gets.to_f
area2 = get_circle_area(radius2)

puts "Площадь второго круга: #{area2}"
