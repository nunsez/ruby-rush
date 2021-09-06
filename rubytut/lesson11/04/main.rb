require_relative 'person'

puts 'У нас есть два человека:'

sergey = Person.new('Сергей', 'Михайлович', 41)
konstantin = Person.new('Константин', 'Львович', 61)

sergey.full_name
puts "И ему #{sergey.age} - #{sergey.age_s}"

konstantin.full_name
puts "И ему #{konstantin.age} - #{konstantin.age_s}"
