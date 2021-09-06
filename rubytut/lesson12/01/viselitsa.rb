require_relative 'game'
require_relative 'result_printer'

word = ARGV[0]

game = Game.new(word)
printer = ResultPrinter.new

while game.status.zero?
    printer.print_status(game)
    game.ask_next_letter
end

printer.print_status(game)
