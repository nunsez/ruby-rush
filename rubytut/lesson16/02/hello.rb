current_path = File.dirname(__FILE__)
file_path = File.join(current_path, 'hello.txt')
text = 'Hello, file!'

f = File.new(file_path, 'a:utf-8')
f.puts text
f.close

puts 'Done!'
