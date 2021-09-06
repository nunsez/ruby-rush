puts 'Введите число 1:'
num1 = gets.to_i

puts 'Введите число 2:'
num2 = gets.to_i

puts 'Введите число 3:'
num3 = gets.to_i

# rubocop:disable Style/StringConcatenation

average = (num1 + num2 + num3) / 3
puts 'Среднее арифметическое: ' + average.to_s

# rubocop:enable Style/StringConcatenation
