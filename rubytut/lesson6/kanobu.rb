variants = %w[Камень Ножницы Бумага]

ui_var = rand(3)

puts 'Введите вариант: 0 - Камень, 1 - Ножницы, 2 - Бумага'
player_var = gets.to_i

# rubocop:disable Style/StringConcatenation

puts 'Вы выбрали: ' + variants[player_var]
puts 'Компьютер выбрал: ' + variants[ui_var]

# rubocop:enable Style/StringConcatenation

abort 'Ничья' if player_var == ui_var

if player_var.zero?
    if ui_var == 1
        abort 'Вы победили'
    else
        abort 'Победил Компьютер'
    end
end

if player_var == 1
    if ui_var == 2
        abort 'Вы победили'
    else
        abort 'Победил Компьютер'
    end
end

if player_var == 2
    if ui_var.zero?
        abort 'Вы победили'
    else
        abort 'Победил Компьютер'
    end
end
