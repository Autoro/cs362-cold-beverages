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
    allow(chiller).to receive(:turn_on)
    allow(freezer).to receive(:turn_on)

    expect { refrigerator.plug_in }.to change(refrigerator, :power).from(:off).to(:on)
    expect(chiller).to have_received(:turn_on)
    expect(freezer).to have_received(:turn_on)
  end

  it "can be unplugged and turn power off" do
    allow(chiller).to receive(:turn_off)
    allow(freezer).to receive(:turn_off)

    refrigerator.plug_in

    expect {refrigerator.unplug }.to change(refrigerator, :power).from(:on).to(:off)
    expect(chiller).to have_received(:turn_off)
    expect(freezer).to have_received(:turn_off)
  end

  it "can set the chiller level" do
    allow(chiller).to receive(:set_level)

    refrigerator.set_chiller_level(5)
    expect(chiller).to have_received(:set_level).with(5)
  end

  it "can set the freezer level" do
    allow(freezer).to receive(:set_level)

    refrigerator.set_freezer_level(5)
    expect(freezer).to have_received(:set_level).with(5)
  end

  it "can print out its status" do
    expect(refrigerator.to_s).to eq(<<~STATUS
        Power: off
        Storage: 200 of 200 available
        Temps: Chiller is 70, Freezer is 70
        Water: Reservoir has 0 remaining.
        STATUS
    )
  end
end
