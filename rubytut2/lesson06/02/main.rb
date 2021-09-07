require_relative 'parent'
require_relative 'child'

parent = Parent.new('Василий Игоревич')
child1 = Child.new('Маша')
child2 = Child.new('Коля')

puts "#{parent.name} послушный: #{parent.obedient?}"
puts "#{child1.name} послушная: #{child1.obedient?}"
puts "#{child2.name} послушный: #{child2.obedient?}"
