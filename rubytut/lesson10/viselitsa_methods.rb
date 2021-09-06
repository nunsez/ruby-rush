# rubocop:disable Naming/AccessorMethodName

def get_letters
    word = ARGV[0]

    if word.nil? || (word == '')
        abort 'Для игры введите загаданное слово в качестве аргумента при запуске программы'
    end

    word.encode('utf-8').chars
end

def get_user_input
    letter = ''

    letter = $stdin.gets.encode('utf-8').chomp while letter == ''

    letter
end

# rubocop:enable Naming/AccessorMethodName

# rubocop:disable Metrics/AbcSize

def check_result(user_input, letters, good_letters, bad_letters)
    e_chars = %w[е ё]
    i_chars = %w[и й]
    char_hash = {
        'е' => 'ё',
        'ё' => 'е',
        'и' => 'й',
        'й' => 'и'
    }

    already_in_good = good_letters.include?(user_input)
    already_in_bad = bad_letters.include?(user_input)

    return 0 if already_in_good || already_in_bad

    if letters.include?(user_input) ||
       (e_chars.include?(user_input) && letters.any? { |c| e_chars.include?(c) }) ||
       (i_chars.include?(user_input) && letters.any? { |c| i_chars.include?(c) })

        good_letters.push(user_input)

        if char_hash.keys.include?(user_input)
            char = char_hash[user_input]
            good_letters.push(char)
        end

        return (letters - good_letters).empty? ? 1 : 0
    end

    bad_letters.push(user_input)

    if char_hash.keys.include?(user_input)
        char = char_hash[user_input]
        bad_letters.push(char)
    end

    -1
end

# rubocop:enable Metrics/AbcSize

def print_status(letters, good_letters, bad_letters, errors)
    puts "Слово: #{get_word_for_print(letters, good_letters)}"
    puts "Ошибки (#{errors}): #{bad_letters.join(', ')}"

    if errors >= 7
        puts
        puts 'Вы проиграли :('
    elsif (letters - good_letters).empty?
        puts
        puts 'Поздравляем, вы выиграли!'
    else
        puts "У вас осталось попыток: #{7 - errors}"
    end
end

def get_word_for_print(letters, good_letters)
    result = letters.map do |c|
        good_letters.include?(c) ? c : '_'
    end

    result.join(' ')
end

def cls
    system 'clear' or system 'cls'
end
