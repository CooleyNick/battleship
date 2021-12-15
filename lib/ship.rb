class Ship
  attr_reader :health, :name, :length
  def initialize(name, length)
  @name = name
  @health = length
  @length = length
  end

  def sunk?
    @health < 1
  end

  def hit
    @health -= 1
  end

end
