puts 'Добро пожаловать в калькулятор!'

puts 'Первое число:'
n1 = $stdin.gets.to_i

puts 'Второе число:'
n2 = $stdin.gets.to_i

puts 'Выберите операцию (+ - * /):'
op = $stdin.gets.chomp

ops_map = {
    '+' => ->(a, b) { a + b },
    '-' => ->(a, b) { a - b },
    '*' => ->(a, b) { a * b },
    '/' => ->(a, b) { a / b }
}

begin
    res = ops_map[op].call(n1, n2)
    puts 'Результат:', res
rescue ZeroDivisionError
    puts 'На ноль делить нельзя'
rescue NoMethodError
    puts 'Нет такой операции'
end
