require 'rexml/document'
require 'date'

file_path = File.join(__dir__, 'data', 'chest.xml')

unless File.exist?(file_path)
    File.open(file_path, 'w:utf-8') do |file|
        file.puts "<?xml version='1.0' encoding='UTF-8'?>"
        file.puts '<wishes></wishes>'
    end
end

doc = nil

begin
    File.open(file_path, 'r:utf-8') { |file| doc = REXML::Document.new(file) }
rescue SystemCallError => e
    puts "Ошибка при чтении файла #{file_path}"
    puts e.message
    exit
rescue REXML::ParseException => e
    puts "Похоже, файл #{file_path} испорчен:"
    puts e.message
    exit
end

puts 'В этом сундуке хранятся ваши желания.'

input_wish = ''

while input_wish.empty?
    puts 'Чего бы вы хотели?'
    input_wish = $stdin.gets.encode('utf-8').strip
end

puts 'До какого числа вы хотите осуществить это желание?'
puts '(укажите дату в формате ДД.ММ.ГГГГ)'
input_date = $stdin.gets.chomp

wish_date = nil

begin
    wish_date = Date.parse(input_date)
rescue ArgumentError
    wish_date = Date.today
end

wishes = doc.root

wish = wishes.add_element('wish')
wish.add_attribute('date', wish_date)
wish.add_text(input_wish)

begin
    File.open(file_path, 'w:utf-8') { |file| doc.write(file, 4) }
rescue SystemCallError
    puts "Ошибка при записи файла #{file_path}"
    exit
end

puts 'Ваше желание в сундуке'
