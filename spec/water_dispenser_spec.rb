require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'

describe 'A water dispenser' do
  let(:vessel) { Vessel.new("FAKE", 100) }
  let(:reservoir) { WaterReservoir.new(10, 10) }
  let(:dispenser) { WaterDispenser.new(reservoir) }

  it "has a reservoir" do
    expect(dispenser.reservoir).to_not be_nil
  end

  it "can dispense to a vessel" do
    dispenser.dispense(vessel)
    expect(dispenser.reservoir).to be_empty
  end

  it "will not dispense more water than it has left" do
    dispenser.dispense(vessel)
    expect(dispenser.reservoir.current_water_volume).to eq(0)
  end
end
