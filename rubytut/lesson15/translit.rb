require 'cyrillizer'

Cyrillizer.language = 'russian'
puts 'Введите фразу для транслитерации:'

input = $stdin.gets.chomp.encode('utf-8')

lat = input.to_lat
cyr = input.to_cyr
result = input == lat ? cyr : lat

puts result
