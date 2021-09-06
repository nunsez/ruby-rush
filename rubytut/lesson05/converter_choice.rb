answer = 'Ваши запасы на сегодня равны: '

puts 'Какая у вас на руках валюта?\n1. Рубли\n2. Доллары'

choice = gets.chomp

puts 'Сколько сейчас стоит 1 доллар?'
usd_rate = gets.to_f

# rubocop:disable Style/StringConcatenation

if choice == '1'
    puts 'Сколько  у вас рублей?'
    rub = gets.to_f

    usd = (rub / usd_rate).round(2)
    puts answer + '$ ' + usd.to_s
end

if choice == '2'
    puts 'Сколько у вас долларов?'
    usd = gets.to_f

    rub = (usd * usd_rate).round(2)
    puts answer + rub.to_s + ' руб.'
end

# rubocop:enable Style/StringConcatenation
