require_relative 'game'
require_relative 'result_printer'
require_relative 'word_reader'

reader = WordReader.new

current_path = File.dirname(__FILE__)
file_path = File.join(current_path, 'data', 'words.txt')
word = reader.read_from_file(file_path)

game = Game.new(word)
printer = ResultPrinter.new

while game.status.zero?
    printer.print_status(game)
    game.ask_next_letter
end

printer.print_status(game)
