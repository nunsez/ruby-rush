current_path = File.dirname(__FILE__)
file_path = File.join(current_path, 'data', 'text.txt')

unless File.exist?(file_path)
    puts "File '#{file_path}' not found!"
    exit
end

f = File.open(file_path, 'r:utf-8')
text = f.read.chomp
f.close

cleaned_text = text.delete(',.!?;:—-')
words = cleaned_text.split

regexp = /^\S{3}$/
three_letters_word_count = words.count { |w| w =~ regexp }

# three_letters_word_count = words.count { |w| w.size == 3 }

puts "Количество слов в тексте, состоящих из трёх букв: #{three_letters_word_count}"
