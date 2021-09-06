current_path = File.dirname(__FILE__)
movies_path = File.join(current_path, 'movies.txt')

abort "File #{movies_path} not found!" unless File.exist?(movies_path)

f = File.new(movies_path, 'r:utf-8')
movies = f.readlines.map(&:chomp)
f.close

number = rand(movies.size + 1)
number -= 1 if number.odd?

puts movies[number]
puts movies[number + 1]
