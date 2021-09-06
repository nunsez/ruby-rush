puts 'How many dice?'

number = gets.to_i

number.times do
    puts rand(1..6)
end
