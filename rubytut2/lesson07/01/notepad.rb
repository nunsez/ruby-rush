require_relative 'lib/post'
require_relative 'lib/link'
require_relative 'lib/memo'
require_relative 'lib/task'

puts 'Привет, я твой блокнот!'
puts 'Что хотите записать в блокнот?'

choices = Post.post_types
choice = -1

until choice.between?(0, choices.size - 1)
    choices.each_with_index do |type, i|
        puts "\t#{i}. #{type}"
    end

    choice = gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console
entry.save
