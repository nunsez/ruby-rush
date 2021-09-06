puts 'Врага какого персонажа вы хотите узнать?'

hero = $stdin.gets.encode('utf-8').chomp.downcase

case hero
when 'бэтмен' then puts 'Джокер'
when 'шерлок холмс' then puts 'Профессор Мориарти'
when 'буратино' then puts 'Карабас-Барабас'
when 'фродо бэггинс' then puts 'Саурон'
when 'моцарт' then puts 'Сальери'
else puts 'Не удалось найти врага'
end
