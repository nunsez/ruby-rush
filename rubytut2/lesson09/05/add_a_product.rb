require 'rexml/document'

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/disk'

types = Product.types
choice = nil

until choice == 'x'
    Product.show_types

    choice = $stdin.gets.chomp

    break if choice == 'x'

    choice = choice.to_i

    next unless choice.between?(0, types.count - 1)

    puts
    puts 'Укажите стоимость продукта в рублях'
    price = $stdin.gets.to_i

    puts
    puts 'Укажите, сколько единиц продукта осталось на складе'
    amount_available = $stdin.gets.to_i

    product = types[choice].new(price: price, amount_available: amount_available)

    product.read_from_console
    product.save_to_xml('products.xml')

    puts
    puts "Продукт #{product.show} сохранён!"
    puts
end

