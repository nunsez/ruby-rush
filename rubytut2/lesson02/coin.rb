num = rand(0..6)

if num.zero?
    puts 'Монета встала на ребро'
elsif num <= 3
    puts 'Выпал орел'
else
    puts 'Выпала решка'
end
