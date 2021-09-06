arr = [1, 2, 3, 4, 5, 6, 7]

puts 'Исходный массив:', arr.to_s

reversed = []

arr.each do |i|
    reversed.unshift i
end

puts 'Новый массив, полученный из исходного:', reversed.to_s
