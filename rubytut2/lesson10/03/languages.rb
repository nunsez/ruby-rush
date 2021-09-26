require 'json'

file_path = File.join(__dir__, 'languages.json')
file = File.read(file_path, encoding: 'utf-8')
languages = JSON.parse(file)

sorted = languages.sort_by { _2 }.reverse
most = sorted.first

puts "Самый популярный язык: #{most.first} (#{most.last})"
puts

sorted.each_with_index { |(name, count), i| puts "#{i + 1}: #{name} (#{count})" }
