require './lib/placement'
require './lib/ship'

RSpec.describe Placement do
  it 'exists' do
  cruiser = Ship.new("Cruiser", 3)
  coordinates = ["A1", "A2", "A3"]
  placement = Placement.new(cruiser, coordinates)
  expect(placement).to be_instance_of(Placement)
  end

  it 'places Cruiser correctly' do
    cruiser = Ship.new("Cruiser", 3)
    coordinates = ["A1", "A2", "A3"]
    placement = Placement.new(cruiser, coordinates)
    expect(placement.valid_placement?).to be true
  end

 it 'coordinate size does not match ship length' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A1", "A2"]
   placement = Placement.new(cruiser, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'coordinate size does not match ship length' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["A2", "A3", "A4"]
   placement = Placement.new(submarine, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'coordinates are not consecutive' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A1", "A2", "A4"]
   placement = Placement.new(cruiser, coordinates)
   expect(placement.valid_placement?).to eq false
 end

 it 'coodinates are not consecutive' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["A1", "C1"]
   placement = Placement.new(submarine, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'coodrinates can not be verticle' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A3", "A2", "A1"]
   placement = Placement.new(cruiser, coordinates)
   expect(placement.valid_placement?).to eq false
 end

 it 'coordinates can not be verticle' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["C1", "B1"]
   placement = Placement.new(submarine, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'coordinates can not be diagonal' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A1", "B2", "C3"]
   placement = Placement.new(cruiser, coordinates)
   expect(placement.valid_placement?).to eq false
 end

 it 'coordinates can not be diagonal' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["C2", "D3"]
   placement = Placement.new(submarine, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'places Submarine valid' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["A1", "A2"]
   placement = Placement.new(submarine, coordinates)
   expect(placement.valid_placement?).to be true
 end

 it 'places Cruiser valid' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["B1", "C1", "D1"]
   placement = Placement.new(cruiser, coordinates)
   expect(placement.valid_placement?).to eq true
 end


end
