time = Time.now
week_day = time.wday

if [0, 6].include?(week_day)
    puts 'Сегодня выходной!'
    exit
end

current_path = File.dirname(__FILE__)
holidays_path = File.join(current_path, 'data', 'holidays.txt')

unless File.exist?(holidays_path)
    puts "File '#{holidays_path}' not found!"
    exit
end

file = File.open(holidays_path, 'r:utf-8')
holidays = file.readlines.map(&:chomp)
file.close

date = time.strftime('%d.%m')

if holidays.include?(date)
    puts 'Сегодня государственный праздник.'
else
    puts 'Сегодня будний день, за работу!'
end
