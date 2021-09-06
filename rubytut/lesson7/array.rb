puts 'Введите N'

n = gets.to_i

i = 1
arr = []

while i <= n
    arr.push i
    i += 1
end

# rubocop:disable Style/StringConcatenation

puts arr.to_s
puts 'Сумма чисел: ' + arr.sum.to_s

# rubocop:enable Style/StringConcatenation
