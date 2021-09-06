# rubocop:disable Style/GlobalVars

$a = 'global'
b = 'local'

def method
    c = 'method local'

    puts "Переменная '$a': #{defined?($a)}"
    puts "Переменная 'b': #{defined?(b)}"
    puts "Переменная 'c': #{defined?(c)}"
end

puts 'inside method:'
method
puts

puts 'top level:'
puts "Переменная '$a': #{defined?($a)}"
puts "Переменная 'b': #{defined?(b)}"
puts "Переменная 'c': #{defined?(c)}"

# rubocop:enable Style/GlobalVars
