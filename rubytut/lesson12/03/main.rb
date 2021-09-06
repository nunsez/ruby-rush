require_relative 'film'

puts 'Фильмы какого режиссера Вы хотите посмотреть?'

director = $stdin.gets.encode('utf-8').chomp
films = []

3.times do
    puts 'Какой-нибудь его хороший фильм?'

    title = $stdin.gets.encode('utf-8').chomp
    film = Film.new title, director

    films.push film
end

film = films.sample

puts "И сегодня вечером рекомендую посмотреть: #{film.title}"
puts "Режиссера: #{film.director}"
