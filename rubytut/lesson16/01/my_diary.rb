puts 'Привет, я твой дневник. Скажи мне что у тебя на уме и в душе?'
puts 'Я сохраню всё, что ты напишешь до строчки "end" в файл.'

current_path = File.dirname(__FILE__)

line = nil
lines = []

while line != 'end'
    line = $stdin.gets.encode('utf-8').chomp
    lines << line
end

lines.pop

time = Time.now
file_name = time.strftime('%Y-%m-%d')
time_string = time.strftime('%H:%M')
separator = '------------------------------'

file_path = File.join(current_path, "#{file_name}.txt")
file = File.new(file_path, 'a:utf-8')

file.puts "\n#{time_string}"

lines.each do |item|
    file.puts item
end

file.puts separator
file.close

puts "Ваша запись сохранена в файле #{file_name}.txt"
puts "Запись сделана в #{time_string}"
