require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

products = []

products << Film.new(
    title: 'Леон', year: 1994, director: 'Люк Бессон', price: 990, amount: 5
)
products << Film.new(
    title: 'Дурак', year: 2014, director: 'Юрий Быков', price: 390, amount: 1
)
products << Book.new(
    title: 'Идиот', genre: 'роман', author: 'Федор Достоевский', price: 1500, amount: 10
)

puts 'Вот какие товары у нас есть:'
puts

products.each { |product| puts product }
