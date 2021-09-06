time = Time.now
week_day = time.wday

if [0, 6].include?(week_day)
    puts 'Сегодня выходной!'
else
    puts 'Сегодня будний день, за работу!'
end
