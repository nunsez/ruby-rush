puts 'Введите строку, которую надо проверить на «палиндромность»:'

original_string = $stdin.gets.encode('UTF-8').chomp
stripped_string = original_string.delete(' ,.!?;:—-')
reversed_string = stripped_string.reverse

if reversed_string == stripped_string
    puts 'Да, это палиндром'
else
    puts 'Нет, это не палиндром'
end
