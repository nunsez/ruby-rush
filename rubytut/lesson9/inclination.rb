# rubocop:disable Metrics/AbcSize

def sklonenie(number, krokodil, krokodila, krokodilov)
    number = 0 if number.nil? || !number.is_a?(Numeric)

    ostatok100 = number % 100

    return krokodilov if (ostatok100 >= 11) && (ostatok100 <= 14)

    ostatok = number % 10

    return krokodil if ostatok == 1

    return krokodila if ostatok >= 2 && ostatok <= 4

    krokodilov if (ostatok >= 5 && ostatok <= 9) || ostatok.zero?
end

# rubocop:enable Metrics/AbcSize

skolko = ARGV[0].to_i

puts "#{skolko} #{sklonenie(skolko, 'негритёнок', 'негритёнка', 'негритят')} " \
     "#{sklonenie(skolko, 'пошел', 'пошли', 'пошли')} купаться в море!"
