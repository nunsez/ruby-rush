require_relative 'person'
require_relative 'film'

person1 = Person.new('Сергей', 'Витальевич', 43)
person2 = Person.new('Марина', 'Энн', 28)
person3 = Person.new('Мадонна', 'Луиза', 58)

person1.film = Film.new('Челюсти', 'Спилберг')
person2.film = Film.new('Список Шиндлера', 'Спилберг')
person3.film = Film.new('Парк Юрского периода', 'Спилберг')

[person1, person2, person3].each do |p|
    puts p.full_name
    puts "с любимым фильмом: #{p.film.title}"
end
