require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it "has a capacity and current volume" do
    reservoir = WaterReservoir.new(10, 10)

    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(10)
  end

  it "is initially empty" do
    reservoir = WaterReservoir.new

    expect(reservoir).to be_empty
  end
end
