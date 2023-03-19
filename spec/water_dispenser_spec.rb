require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

describe 'A water dispenser' do
  it "has a reservoir" do
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to_not be_nil
  end
end
