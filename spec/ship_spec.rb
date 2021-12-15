require './lib/ship'

RSpec.describe Ship do

  it 'is an instance of the class ship' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  it 'hasn not sunk' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to be false
  end

  it 'loses health when hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to be false
    cruiser.hit
    expect(cruiser.sunk?).to be true
  end

end
