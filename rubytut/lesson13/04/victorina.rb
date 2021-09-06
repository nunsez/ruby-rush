file_paths = {
    questions: 'data/questions.txt',
    answers: 'data/answers.txt'
}

content = {}

file_paths.each do |type, path|
    if File.exist?(path)
        file = File.new(path, 'r:utf-8')
        content[type] = file.readlines.map(&:chomp)
        file.close
    else
        abort "Файл '#{path}' не найден!"
    end
end

puts 'Мини-викторина. Ответьте на вопросы.'

victorina = content.values.transpose
answers_count = victorina.size
right_answers_count = 0

victorina.each do |q, a|
    puts q
    player_a = $stdin.gets.encode('UTF-8').chomp

    if a == player_a
        right_answers_count += 1
        puts 'Верный ответ!'
    else
        puts "Неправильно. Правильный ответ: #{a}"
    end

    puts
end

mod10 = right_answers_count % 10

message =
    case mod10
    when 1 then 'правильный ответ'
    when 2..4 then 'правильных ответа'
    else 'правильных ответов'
    end

abort "У вас #{right_answers_count} #{message} из #{answers_count}"
