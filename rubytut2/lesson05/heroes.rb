puts 'Врага какого персонажа вы хотите узнать?'

heros_antiheros = {
    'бэтмен' => 'Джокер',
    'шерлок холмс' => 'Профессор Мориарти',
    'буратино' => 'Карабас-Барабас',
    'фродо бэггинс' => 'Саурон',
    'моцарт' => 'Сальери'
}

hero = $stdin.gets.encode('utf-8').chomp.downcase

unless heros_antiheros.key?(hero)
    puts 'Не удалось найти врага'
    exit
end

antihero = heros_antiheros[hero]

puts "Враг этого героя: #{antihero}"
