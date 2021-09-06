require_relative 'person'

puts 'У нас есть три человека:'

gavrila = Person.new('Гаврила', 'Петрович')
fedor = Person.new('Фёдор', 'Петрович')
vasiliy = Person.new('Василий', 'Алибабаевич')

gavrila.full_name
fedor.full_name
vasiliy.full_name
