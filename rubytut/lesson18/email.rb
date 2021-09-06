puts 'Введите email:'

input = $stdin.gets.encode('utf-8').chomp
email_regexp = /^\w+@\w+\.[a-z]{2,4}$/i

if input =~ email_regexp
    puts 'Спасибо!'
else
    puts 'Это не email'
end
