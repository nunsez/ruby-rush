require_relative 'viselitsa_methods'

cls

letters = get_letters
errors = 0
good_letters = []
bad_letters = []

while errors < 7
    print_status(letters, good_letters, bad_letters, errors)
    puts 'Введите следующую букву'

    user_input = get_user_input
    result = check_result(user_input, letters, good_letters, bad_letters)

    break if result == 1

    errors += 1 if result == -1

    puts
end

print_status(letters, good_letters, bad_letters, errors)
