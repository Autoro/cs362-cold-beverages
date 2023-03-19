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

  it "is no longer empty when we fill it" do
    reservoir = WaterReservoir.new
    reservoir.fill
    expect(reservoir).to_not be_empty
  end

  it "is empty when we drain it" do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end
end
