puts 'Добро пожаловать в калькулятор!'

puts 'Первое число:'
n1 = $stdin.gets.to_f

puts 'Второе число:'
n2 = $stdin.gets.to_f

puts 'Выберите операцию (+ - * /):'
op = $stdin.gets.chomp

ops_map = {
    '+': proc { |a, b| a + b },
    '-': proc { |a, b| a - b },
    '*': proc { |a, b| a * b },
    '/': proc { |a, b| a / b }
}

begin
    res = ops_map[op.to_sym].call(n1, n2)
    puts 'Результат:', res
rescue NoMethodError
    puts 'Нет такой операции'
end
