ans = rand(16)
victory = 'Ура, вы выиграли!'
defeat = "Вы проиграли! Правильный ответ: #{ans}"
heat = 'Тепло '
cold = 'Холодно '
more = '(нужно больше)'
less = '(нужно меньше)'

puts 'Загадано число от 0 до 15, отгадайте какое?'

num = gets.to_i
diff = (ans - num).abs

abort victory if diff.zero?

message =
    if diff <= 2
        heat
    else
        cold
    end

message =
    if num < ans
        message + more
    else
        message + less
    end

puts message

num = gets.to_i
diff = (ans - num).abs

abort victory if diff.zero?

message =
    if diff <= 2
        heat
    else
        cold
    end

message =
    if num < ans
        message + more
    else
        message + less
    end

puts message

num = gets.to_i
diff = (ans - num).abs

if diff.zero?
    abort victory
else
    abort defeat
end
