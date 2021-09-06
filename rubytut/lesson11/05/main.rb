require_relative 'body_builder'

bb1 = BodyBuilder.new
bb2 = BodyBuilder.new
bb3 = BodyBuilder.new

rand(10).times { bb1.pump('Бицепсы') }
rand(10).times { bb1.pump('Трицепсы') }
rand(10).times { bb1.pump('Дельтовидка') }

rand(10).times { bb2.pump('Бицепсы') }
rand(10).times { bb2.pump('Трицепсы') }
rand(10).times { bb2.pump('Дельтовидка') }

rand(10).times { bb3.pump('Бицепсы') }
rand(10).times { bb3.pump('Трицепсы') }
rand(10).times { bb3.pump('Дельтовидка') }

puts 'Первый бодибилдер:'
bb1.show_muscles
puts

puts 'Второй бодибилдер:'
bb2.show_muscles
puts

puts 'Третий бодибилдер:'
bb3.show_muscles
