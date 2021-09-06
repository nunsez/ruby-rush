puts 'Какой длины будет массив случайных чисел?'

n = gets.to_i

i = 0
arr = []

while i < n
    arr.push rand(100)
    i += 1
end

puts arr.to_s
puts 'Самое большое число:', arr.max
