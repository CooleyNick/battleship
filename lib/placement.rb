require './lib/ship'
require './lib/cell'
class Placement

  attr_reader :letters, :nums
  def initialize(ship, coordinates)
    @letters = []
    @nums = []
    @ship = ship
    @coordinates = coordinates
  end

  def split_coordinates
    @coordinates.each do |coordinate|
      @letters << coordinate.split('').first
      @nums << coordinate.split('').last.to_i
    end
  end

   def valid_placement?
    split_coordinates
    @ship.length == @coordinates.size &&
    @nums == @nums.sort &&
    (@nums.last - @nums.first + 1 == @ship.length || @nums.uniq.size == 1) &&
    (@letters.last.ord - @letters.first.ord + 1 == @ship.length || @letters.uniq.size == 1) &&
    @letters.uniq.size != @nums.uniq.size &&
    (@letters.uniq.size == 1 || @nums.uniq.size == 1)
   end

end
