file_path = ARGV[0]

abort 'Введите путь к файлу' if file_path.nil?

abort 'Файл не найден' unless File.exist?(file_path)

f = File.open(file_path, 'r:utf-8')

lines = f.readlines
f.close

empty_lines = lines.reduce(0) do |acc, line|
    acc += 1 if line.chomp.empty?
    acc
end

puts "Открыли файл: #{file_path}"
puts "Всего строк: #{lines.size}"
puts "Пустых строк: #{empty_lines}"
puts 'Последние 5 строк файла:'
puts
puts lines.last(5)
