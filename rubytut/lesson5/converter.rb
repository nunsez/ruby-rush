puts 'Сколько сейчас стоит 1 доллар в рублях?'
rate = gets.to_f

puts 'Сколько  у вас рублей?'
rubles = gets.to_f

# rubocop:disable Style/StringConcatenation

dollars = rubles / rate
puts 'Ваши запасы равны: $ ' + dollars.round(2).to_s

# rubocop:enable Style/StringConcatenation
