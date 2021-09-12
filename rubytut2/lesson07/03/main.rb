require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

product = Film.new(title: 'Леон', year: 1994)

puts product
puts

product.amount = 10
product.update(price: 1000, director: 'Luc Besson', lol: 'kek')

puts 'Product update!'
puts product
