require_relative '../lib/freezer_fake'

describe 'A freezer' do
  let(:freezer) { TestFreezer.new(100) }
  let(:item) { Item.new("FAKE", 5) }

  it "has a capacity and temperature" do
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it "can be turned on" do
    expect { freezer.turn_on }.to change(freezer, :power).from(:off).to(:on)
  end

  it "can be turned off" do
    freezer.turn_on
    expect { freezer.turn_off }.to change(freezer, :power).from(:on).to(:off)
  end

  it "can add an item" do
    freezer.add(item)
    expect(freezer.contents).to include(item)
  end

  it "can calculate remaining capacity" do
    expect(freezer.remaining_capacity).to eq(100)
  end

  it "can change temperature after setting a level" do
    expect { freezer.set_level(5) }.to change(freezer, :temperature).from(70).to(20)
  end
end
