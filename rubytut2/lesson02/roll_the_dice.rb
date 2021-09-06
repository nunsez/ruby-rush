def show_rolling_die(range)
    100.times do
        print "#{rand(range)}\r"
        sleep 0.01
    end
end

range = 1..6

puts 'How many dice?'
number = gets.to_i
puts

number.times do
    show_rolling_die(range)
    result = rand(range)
    puts result
end
