require 'rexml/document'

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disk'

products = Product.read_from_xml('products.xml')

total_price = 0
choice = nil

until choice == 'x'
    Product.showcase(products)

    choice = $stdin.gets.chomp

    break if choice == 'x'

    choice = choice.to_i

    if choice.between?(0, products.size - 1)
        product = products[choice]
        total_price += product.buy
    end
end

puts "Спасибо за покупки, с Вас #{total_price} руб."
