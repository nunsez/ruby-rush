require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/product_collection'

products = ProductCollection.from_dir(File.join(__dir__, 'data'))
sorted_products = products.sort(by: :price, order: :asc)

puts
puts 'products from_dir:'
puts products.to_a
puts
puts 'sorted_products:'
puts sorted_products.to_a
puts
puts 'products again:'
puts products.to_a
puts
puts 'ProductCollection (products) after sorting (chaining workflow):'
puts sorted_products
