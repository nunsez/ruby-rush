class ResultPrinter
    ERRORS = 8

    def initialize
        @status_image = []

        current_path = File.dirname(__FILE__)

        ERRORS.times do |err|
            file_path = current_path + "/image/#{err}.txt"

            begin
                f = File.new(file_path, 'r:utf-8')
                @status_image << f.read
                f.close
            rescue SystemCallError
                @status_image << "\n [ изображение не найдено ] \n"
            end
        end
    end

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
        puts @status_image[errors]
    end
end
