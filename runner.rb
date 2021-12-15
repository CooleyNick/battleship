require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/placement'
require './battleship_runner'


cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
a = ["A1", "A2", "A3"]
b = ["A1", "B1"]
c = ["B1", "B2"]
board.create_board

game = Game.new
game.start
