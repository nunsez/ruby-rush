class Game
    E_CHARS = %w[е ё].freeze
    I_CHARS = %w[и й].freeze
    CHAR_HASH = {
        'е' => 'ё',
        'ё' => 'е',
        'и' => 'й',
        'й' => 'и'
    }.freeze

    attr_reader :status, :errors, :letters, :good_letters, :bad_letters

    def initialize(word)
        @letters = get_letters(word)
        @errors = 0
        @good_letters = []
        @bad_letters = []
        @status = 0
    end

    def get_letters(word)
        if word.nil? || (word == '')
            abort 'Для игры введите загаданное слово в качестве аргумента при запуске программы'
        end

        word.chars
    end

    def ask_next_letter
        puts 'Введите следующую букву'

        letter = ''
        letter = $stdin.gets.encode('utf-8').chomp while letter == ''

        next_step(letter)
    end

    # rubocop:disable Metrics/AbcSize

    def next_step(letter)
        return if (@status == -1) || (@status == 1)

        already_in_good = @good_letters.include?(letter)
        already_in_bad = @bad_letters.include?(letter)

        return if already_in_good || already_in_bad

        if @letters.include?(letter) ||
           (E_CHARS.include?(letter) && @letters.any? { |c| E_CHARS.include?(c) }) ||
           (I_CHARS.include?(letter) && @letters.any? { |c| I_CHARS.include?(c) })

            @good_letters.push(letter)

            @good_letters.push(CHAR_HASH[letter]) if CHAR_HASH.keys.include?(letter)

            @status = 1 if (@letters - @good_letters).empty?
        else
            @errors += 1
            @bad_letters.push(letter)

            @bad_letters.push(CHAR_HASH[letter]) if CHAR_HASH.keys.include?(letter)

            @status = -1 if @errors >= 7
        end
    end

    # rubocop:enable Metrics/AbcSize
end
