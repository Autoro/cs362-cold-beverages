require_relative '../lib/fake_refrigerator'
require_relative '../lib/fake_chiller'
require_relative '../lib/fake_freezer'

describe 'A refrigerator' do
  let(:chiller) { FakeChiller.new(100) }
  let(:freezer) { FakeFreezer.new(100) }
  let(:reservoir) { WaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }
  let(:refrigerator) { FakeRefrigerator.new(chiller, freezer, dispenser, reservoir) }
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

  it "can calculate its total capacity" do
    expect(refrigerator.total_capacity).to eq(chiller.capacity + freezer.capacity)
  end

  it "can calculate its remaining capacity" do
    expect(refrigerator.remaining_capacity).to eq(chiller.remaining_capacity + freezer.remaining_capacity)
  end

  it "can be plugged in and turn power on" do
    expect { refrigerator.plug_in }.to change(refrigerator, :power).from(:off).to(:on)
                                  .and change(refrigerator.chiller, :power).from(:off).to(:on)
                                  .and change(refrigerator.freezer, :power).from(:off).to(:on)
  end
end
