require './lib/cell'
require './lib/placement'

class Board

    attr_reader :cells
    def initialize
      @cells = {}
      @letters = []
      @nums = []
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

    def split_coordinates(ship, coordinates)
      coordinates.each do |coordinate|
        @letters << coordinate.split('').first
        @nums << coordinate.split('').last.to_i
      end
    end


    def valid_placement?(ship, coordinates)
      split_coordinates(ship, coordinates)
      ship.length == coordinates.size &&
      @nums == @nums.sort &&
      (@nums.last - @nums.first + 1 == ship.length || @nums.uniq.size == 1) &&
      (@letters.last.ord - @letters.first.ord + 1 == ship.length || @letters.uniq.size == 1) &&
      @letters.uniq.size != @nums.uniq.size &&
      (@letters.uniq.size == 1 || @nums.uniq.size == 1)
    end

    def clear
      @nums = []
      @letters = []
    end

    def place(ship, coordinates)
        coordinates.each do |coordinate|
            @cells[coordinate].place_ship(ship)
          end
    end


    def render(arg = false)
      puts "  1 2 3 4 \n" +
     "A" + " " + @cells["A1"].render(arg) + " " + @cells["A2"].render(arg) + " " + @cells["A3"].render(arg) + " " + @cells["A4"].render(arg) + " \n"  +
     "B" + " " + @cells["B1"].render(arg) + " " + @cells["B2"].render(arg) + " " + @cells["B3"].render(arg) + " " + @cells["B4"].render(arg) + " \n"  +
     "C" + " " + @cells["C1"].render(arg) + " " + @cells["C2"].render(arg) + " " + @cells["C3"].render(arg) + " " + @cells["C4"].render(arg) + " \n"  +
     "D" + " " + @cells["D1"].render(arg) + " " + @cells["D2"].render(arg) + " " + @cells["D3"].render(arg) + " " + @cells["D4"].render(arg) + " \n"
    end

end
