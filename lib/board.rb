require './lib/cell'
require './lib/placement'

class Board

    attr_reader :cells
    def initialize
      @cells = {}
    end

    def create_board
      ("A"..."E").each do |letter|
        (1...5).each do |number|
          @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
        end
      end
    end

    def valid_coordinate?(coordinate)
      @cells.has_key?(coordinate)
    end

    def valid_placement?(ship, coordinates)
      placement = Placement.new(ship, coordinates)
      return placement.valid_placement?
    end


end
