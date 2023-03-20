require_relative '../lib/refrigerator'
require_relative '../lib/fake_chiller'
require_relative '../lib/fake_freezer'

describe 'A refrigerator' do
  let(:chiller) { FakeChiller.new(100) }
  let(:freezer) { FakeFreezer.new(100) }
  let(:reservoir) { WaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }
  let(:item) { Item.new("FAKE", 5) }

  it "has a chiller, freezer, dispenser, and reservoir" do
    expect(refrigerator.chiller).to_not be_nil
    expect(refrigerator.freezer).to_not be_nil
    expect(refrigerator.water_dispenser).to_not be_nil
    expect(refrigerator.water_reservoir).to_not be_nil
  end

  it "can chill an item" do
    refrigerator.chill(item)
    expect(refrigerator.chiller.contents).to include(item)
  end

  it "can freeze an item" do
    refrigerator.freeze(item)
    expect(refrigerator.freezer.contents).to include(item)
  end
end
