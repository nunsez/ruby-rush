# Массивы с наборами мастей и достоинств
values = %w[2 3 4 5 6 7 8 9 10 J Q K A]

# Буби, Черви, Крести, Пики
suits = %w[Diamonds Hearts Clubs Spades]

# Выведем произвольную карты, выбрав по одному элементу из массивов
puts "#{values.sample} of #{suits.sample}"
