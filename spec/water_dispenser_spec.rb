require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

describe 'A water dispenser' do
  it "has a reservoir" do
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to_not be_nil
  end

  it "can dispense to a vessel" do
    reservoir = WaterReservoir.new(10, 10)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('FAKE', 10)

    dispenser.dispense(vessel)

    expect(dispenser.reservoir).to be_empty
  end
end
