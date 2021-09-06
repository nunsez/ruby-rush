def check_number(ans, num)
    victory = 'Ура, вы выиграли!'
    heat = 'Тепло '
    cold = 'Холодно '
    more = '(нужно больше)'
    less = '(нужно меньше)'

    diff = (ans - num).abs

    if diff.zero?
        puts victory
        return true
    end

    message = diff <= 2 ? heat : cold
    message += num < ans ? more : less

    puts message
end

# rubocop:disable Style/StringConcatenation

ans = rand(16)
defeat = 'Вы проиграли! Правильный ответ: ' + ans.to_s

# rubocop:enable Style/StringConcatenation

puts 'Загадано число от 0 до 15, отгадайте какое?'

i = 0
while i < 3
    num = gets.to_i
    is_victory = check_number(ans, num)

    exit if is_victory

    i += 1
end

abort defeat
