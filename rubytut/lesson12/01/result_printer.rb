# rubocop:disable Metrics/ClassLength

class ResultPrinter
    # rubocop:disable Metrics/AbcSize

    def print_status(game)
        cls
        puts "Слово: #{get_word_for_print(game.letters, game.good_letters)}"
        puts "Ошибки: #{game.bad_letters.join(', ')}"

        print_viselitsa(game.errors)

        case game.status
        when -1
            puts 'Вы проиграли :('
            puts "Загаданное слово было: #{game.letters.join}"
        when 1
            puts 'Поздравляем, вы выиграли!'
        else
            puts "У вас осталось попыток: #{7 - game.errors}"
        end
    end

    # rubocop:enable Metrics/AbcSize

    def get_word_for_print(letters, good_letters)
        letters
            .map { |c| good_letters.include?(c) ? c : '_' }
            .join(' ')
    end

    def cls
        system 'clear' or system 'cls'
    end

    def print_viselitsa(errors)
        case errors
        when 0
            puts "
                _______
                |/
                |
                |
                |
                |
                |
                |
                |
              __|________
              |         |
            "
        when 1
            puts "
                _______
                |/
                |     ( )
                |
                |
                |
                |
                |
                |
              __|________
              |         |
            "
        when 2
            puts "
                _______
                |/
                |     ( )
                |      |
                |
                |
                |
                |
                |
              __|________
              |         |
            "
        when 3
            puts "
                _______
                |/
                |     ( )
                |      |_
                |        \\
                |
                |
                |
                |
              __|________
              |         |
            "
        when 4
            puts "
                _______
                |/
                |     ( )
                |     _|_
                |    /   \\
                |
                |
                |
                |
              __|________
              |         |
              "
        when 5
            puts "
                _______
                |/
                |     ( )
                |     _|_
                |    / | \\
                |      |
                |
                |
                |
              __|________
              |         |
            "
        when 6
            puts "
                _______
                |/
                |     ( )
                |     _|_
                |    / | \\
                |      |
                |     / \\
                |    /   \\
                |
              __|________
              |         |
            "
        when 7
            puts "
                _______
                |/     |
                |     (_)
                |     _|_
                |    / | \\
                |      |
                |     / \\
                |    /   \\
                |
              __|________
              |         |
            "
        end
    end
end

# rubocop:enable Metrics/ClassLength
