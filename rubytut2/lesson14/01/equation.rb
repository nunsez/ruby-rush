require 'byebug'

def print_root(x_real, x_complex)
    puts 'Solution:'
    print x_real
    print ' +' if x_complex.positive?
    print " #{x_complex} * i" unless x_complex.zero?
    puts
end

puts 'Solve equation: A * x^2 + B * x + C = 0'

puts 'Enter A:'
a = $stdin.gets.to_f

puts 'Enter B:'
b = $stdin.gets.to_f

puts 'Enter C:'
c = $stdin.gets.to_f

abort "It is linear equation! x = #{-c / b}" if a.zero?

discr = b**2 - 4 * a * c

if discr.negative?
    x1_real = -b / (2 * a)
    x1_complex = Math.sqrt(-discr) / (2 * a)

    x2_real = -b / (2 * a)
    x2_complex = -Math.sqrt(-discr) / (2 * a)
else
    x1_real = (-b + Math.sqrt(discr)) / (2 * a)
    x1_complex = 0

    x2_real = (-b - Math.sqrt(discr)) / (2 * a)
    x2_complex = 0
end

print_root(x1_real, x1_complex)
print_root(x2_real, x2_complex)
