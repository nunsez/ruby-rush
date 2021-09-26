require 'json'

file = File.read(File.join(__dir__, 'elements.json'), encoding: 'utf-8')
table = JSON.parse(file)

puts "У нас всего элементов: #{table.size}"
puts table.keys.join(' ')

puts 'О каком элементе хотите узнать?'
element = $stdin.gets.chomp

if table.key?(element)
    puts "Первооткрывателем этого элемента считается: #{table[element]}"
else
    puts 'Извините, про такой элемент мы еще не знаем.'
end
