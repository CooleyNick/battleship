class Cell

  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = !@fired_upon
    return if @ship == nil
    @ship.hit
  end

  def render(show_ship = false)

    case
    when show_ship == false && @fired_upon == true && @ship == nil then "M"
    when show_ship == true && @ship !=nil && @fired_upon == false then "S"
    when show_ship == false && @fired_upon == true && @ship.sunk? then "X"
    when show_ship == false && @fired_upon == true && @ship != nil then "H"
    else
      "."
    end

  end

end
