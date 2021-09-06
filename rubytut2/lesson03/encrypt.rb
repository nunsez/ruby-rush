require 'digest'

puts 'Введите слово или фразу для шифрования:'

text = $stdin.gets.encode('utf-8').chomp

map = {
    1 => {
        name: 'MD5',
        method: proc { |t| Digest::MD5.hexdigest(t) }
    },
    2 => {
        name: 'SHA1',
        method: proc { |t| Digest::SHA1.hexdigest(t) }
    }
}

puts 'Каким способом зашифровать:'

map.each do |key, hash|
    puts "#{key}. #{hash[:name]}"
end

type = $stdin.gets.to_i

until map.key?(type)
    puts "Выберите из: #{map.keys.join(', ')}"
    type = $stdin.gets.to_i
end

encrypted = map[type][:method].call(text)

puts 'Вот что получилось:'
puts encrypted
