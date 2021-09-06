def print_stars(num)
    num = 0 if num.nil? || !num.is_a?(Numeric)

    star = '*'
    puts star * num
end

puts 'Сколько вам звезд на погоны?'
n = $stdin.gets.to_i

puts 'Вот ваши звезды :)'
print_stars(n)
