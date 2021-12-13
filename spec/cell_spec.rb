require './lib/ship'
require './lib/cell'


RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_an_instance_of(Cell)
  end

  it 'takes a coordinate as an argument' do
  cell = Cell.new("B4")
  expect(cell.coordinate).to eq('B4')
  end

  it 'has no ship yet' do
  cell = Cell.new("B4")
  expect(cell.ship).to eq nil
 end

 it 'has an empty cell' do
   cell = Cell.new("B4")
   expect(cell.empty?).to be true
 end

 it 'is a ship' do
   cruiser = Ship.new("Cruiser", 3)
   expect(cruiser).to be_an_instance_of(Ship)
 end

 it 'can have a ship placed in a cell' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.empty?).to be false
  end

  it 'returns false if a ship is in the cell but is not fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to be false
  end

  it 'can have a ship placed in a cell be fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    expect(cell.fired_upon?).to be true
 end

 it 'returns the correct render response to being fired on' do
  cell_1 = Cell.new("B4")
  expect(cell_1.render).to eq(".")
  cell_1.fire_upon
  expect(cell_1.render).to eq("M")
 end

 it 'returns the correct render response to opponent after a ship is placed' do
  cell_2 = Cell.new("C3")
  cruiser = Ship.new("Cruiser", 3)
  cell_2.place_ship(cruiser)
  expect(cell_2.render).to eq(".")
 end

 it 'shows the user where their ship is placed' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    expect(cell_2.render(true)).to eq("S")
  end

  it 'shows when an enemy ship has been hit to user' do
  cell_2 = Cell.new("C3")
  cruiser = Ship.new("Cruiser", 3)
  cell_2.place_ship(cruiser)
  cell_2.fire_upon
  expect(cell_2.render).to eq("H")
 end

 it 'returns correct response to cruiser not being sunk after 1 hit' do
  cell_2 = Cell.new("C3")
  cruiser = Ship.new("Cruiser", 3)
  cell_2.place_ship(cruiser)
  cell_2.fire_upon
  expect(cruiser.sunk?).to be false
end

it 'returns correct render response to cruiser being sunk' do
  cell_2 = Cell.new("C3")
  cruiser = Ship.new("Cruiser", 3)
  cell_2.place_ship(cruiser)
  cell_2.fire_upon
  cruiser.hit
  cruiser.hit
  cruiser.hit
  expect(cruiser.sunk?).to be true
  expect(cell_2.render).to eq ("X")
end

end
