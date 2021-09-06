current_path = File.dirname(__FILE__)
file_path = File.join(current_path, 'data', 'quotes.txt')

if File.exist?(file_path)
    f = File.new(file_path, 'r:utf-8')
    lines = f.readlines
    f.close
    puts lines.sample
else
    puts 'Файл не найден'
end
