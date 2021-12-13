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

    def place(ship, coordinates)
    return if valid_placement?(ship, coordinates) == false
      coordinates.each do |coordinate|
        return if @cells[coordinate].empty? == false
        @cells[coordinate].place_ship(ship)
      end
      return @cells
    end

    def render(arg = false)
      return "  1 2 3 4 \n" +
      "A" + " " + @cells["A1"].render(arg) + " " + @cells["A2"].render(arg) + " " + @cells["A3"].render(arg) + " " + @cells["A4"].render(arg) + " \n"  +
      "B" + " " + @cells["B1"].render(arg) + " " + @cells["B2"].render(arg) + " " + @cells["B3"].render(arg) + " " + @cells["B4"].render(arg) + " \n"  +
      "C" + " " + @cells["C1"].render(arg) + " " + @cells["C2"].render(arg) + " " + @cells["C3"].render(arg) + " " + @cells["C4"].render(arg) + " \n"  +
      "D" + " " + @cells["D1"].render(arg) + " " + @cells["D2"].render(arg) + " " + @cells["D3"].render(arg) + " " + @cells["D4"].render(arg) + " \n"
    end

end
