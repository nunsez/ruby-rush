def slice(arr, num)
    return [] unless arr.is_a?(Array)

    num = arr.size if num.nil? || !num.is_a?(Numeric)

    arr.take(num)
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

puts 'Вот какая палка колбасы у нас есть:', array.to_s
puts 'Сколько первых элементов вам отрезать?'

number = $stdin.gets.to_i
result = slice(array, number)

puts 'Вот ваша колбаса:', result.to_s
