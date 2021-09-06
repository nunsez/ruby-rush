first = 172.169
second = 31.514

puts first
puts second

puts 'Оба числа равны' if first == second

# rubocop:disable Style/StringConcatenation

puts 'Наибольшее число: ' + first.to_s if first > second

puts 'Наибольшее число: ' + second.to_s if second > first

# rubocop:enable Style/StringConcatenation
