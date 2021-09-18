require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

current_path = File.dirname(__FILE__)

film_path = File.join(current_path, 'data', 'films', '01.txt')
film = Film.from_file(film_path)

book_path = File.join(current_path, 'data', 'books', '01.txt')
book = Book.from_file(book_path)

puts film
puts book

begin
    Product.from_file(film_path)
rescue NotImplementedError => e
    puts
    puts e.message
end
