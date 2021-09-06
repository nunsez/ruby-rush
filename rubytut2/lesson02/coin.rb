num = rand(11)

if num.zero?
    puts 'Монета встала на ребро'
elsif num <= 5
    puts 'Выпал орел'
else
    puts 'Выпала решка'
end
