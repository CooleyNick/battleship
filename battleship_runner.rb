require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/placement'
require './lib/game'
#
#
#
#
# class Game
#   def initialize
#     @player = []
#     @computer = []
#     @board = Board.new
#     @cruiser = Ship.new("Cruiser", 3)
#     @submarine = Ship.new("Submarine", 2)
#   end
#
#   def input
#     input = gets.chomp
#   end
#
#
#   def start
#     p "Welcome to Battleship!"
#     p "Press p to play or q to quit."
#     if input == 'p'
#       @board.create_board
#       p @board.render
#       place_cruiser
#     end
#   end
#
#   def place_cruiser
#     p 'Place your Cruiser in 3 coordinates'
#     coord_1 = input.to_s.upcase
#     coord_2 = input.to_s.upcase
#     coord_3 = input.to_s.upcase
#     until @board.valid_placement?(@cruiser, [coord_1, coord_2, coord_3]) == true
#       place_cruiser
#     end
#       @board.place(@cruiser, [coord_1, coord_2, coord_3])
#     place_sub
#   end
#
#   def place_sub
#     p @board.render(true)
#     p 'Place your Submarine in 2 coordinates'
#     coord_4 = input.to_s.upcase
#     coord_5 = input.to_s.upcase
#     until @board.valid_placement?(@submarine, [coord_4, coord_5]) == true
#       place_sub
#     end
#     @board.place(@submarine, [coord_4, coord_5])
#     turns
#   end
#
#   def computer_place_ships
#   end
#
#   def turns
#     p "fuck this"
#   end
# end

# cruiser = Ship.new("Cruiser", 3)
# submarine = Ship.new("Submarine", 2)
# a = ["A1", "A2", "A3"]
# b = ["A1", "B1"]
# c = ["B1", "B2"]


game = Game.new
game.start
