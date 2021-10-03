require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'

puts 'Привет, я блокнот версия 2, записываю новые записи в базу PostgresQL :)'
puts 'Что хотите записать сегодня?'

choices = Post.post_types.keys
choice = -1

until choice.between?(0, choices.size - 1)
    choices.each_with_index do |type, i|
        puts "\t#{i}. #{type}"
    end

    choice = $stdin.gets.chomp.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console
entry_id = entry.save_to_db

puts "Запись сохранена в базе, id = #{entry_id}"
