puts 'Введите строку с хэштегами:'

input = $stdin.gets.encode('utf-8').chomp
hashtag_regexp = /#[[:word:]-]+/
list = input.scan(hashtag_regexp)

puts "Нашли вот такие хэштеги: #{list.join(', ')}"
