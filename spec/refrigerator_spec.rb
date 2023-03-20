require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  let(:chiller) { Chiller.new(100) }
  let(:freezer) { Freezer.new(100) }
  let(:reservoir) { WaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it "has a chiller, freezer, dispenser, and reservoir" do
    expect(refrigerator.chiller).to_not be_nil
    expect(refrigerator.freezer).to_not be_nil
    expect(refrigerator.water_dispenser).to_not be_nil
    expect(refrigerator.water_reservoir).to_not be_nil
  end
end
