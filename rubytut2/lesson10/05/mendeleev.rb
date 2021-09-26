require 'json'

Warning[:experimental] = false

file = File.read(File.join(__dir__, 'elements.json'), encoding: 'utf-8')
table = JSON.parse(file)

puts "У нас всего элементов: #{table.size}"
puts table.keys.join(' ')
puts

puts 'О каком элементе хотите узнать?'
element = $stdin.gets.chomp.capitalize
puts

el = table[element]&.transform_keys(&:to_sym)

if el
    # one line pattern matching is experimental in ruby 3.0.2
    el => { number:, name:, discoverer:, year:, density: }

    puts "Порядковый номер: #{number}"
    puts "Название: #{name}"
    puts "Первооткрыватель: #{discoverer} (#{year}#{' г.' if year.is_a?(Numeric)})"
    puts "Плотность: #{density} г/см³"
else
    puts 'Извините, про такой элемент мы еще не знаем.'
end
