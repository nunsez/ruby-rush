def show_rolling_die(range)
    100.times do
        print "#{rand(range)}\r"
        sleep 0.01
    end
end

RANGE = (1..6)

puts 'How many dice?'
number = gets.to_i
puts

sum = 0

number.times do
    die = rand(RANGE)
    sum += die

    show_rolling_die(RANGE)
    puts die
end

puts "Sum of dice: #{sum}"
