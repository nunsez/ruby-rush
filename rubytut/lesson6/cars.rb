cars = %w[
    Ford
    Mercedes
    Maybach
    Citroen
    Mazda
    Toyota
    Lexus
    Nissan
]

# rubocop:disable Style/StringConcatenation

puts 'У нас всего ' + cars.length.to_s + ' машин. Вам какую?'
num = gets.to_i

car = cars[num]

if car
    abort 'Поздравляем, вы получили:\n' + car
else
    abort 'Извините, машины с таким номером у нас нет :('
end

# rubocop:enable Style/StringConcatenation
