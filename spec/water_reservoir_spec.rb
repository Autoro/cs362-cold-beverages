require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:reservoir) { WaterReservoir.new(10, 10) }
  let(:empty_reservoir) { WaterReservoir.new }

  it "has a capacity and current volume" do
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(10)
  end

  it "is initially empty" do
    expect(empty_reservoir).to be_empty
  end

  it "is no longer empty when we fill it" do
    empty_reservoir.fill
    expect(empty_reservoir).to_not be_empty
  end

  it "is empty when we drain it" do
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(5)
  end
end
