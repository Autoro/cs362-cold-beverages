require_relative '../lib/chiller'

class TestChiller < Chiller
  attr_reader :power, :contents
end

describe 'A chiller' do
  let(:chiller) { TestChiller.new(100) }
  let(:item) { Item.new("FAKE", 5) }

  it "has a capacity and temperature" do
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it "can be turned on" do
    expect { chiller.turn_on }.to change(chiller, :power).from(:off).to(:on)
  end

  it "can be turned off" do
    chiller.turn_on
    expect { chiller.turn_off }. to change(chiller, :power).from(:on).to(:off)
  end

  it "can add an item" do
    chiller.add(item)
    expect(chiller.contents).to include(item)
  end

  it "can calculate remaining capacity" do
    expect(chiller.remaining_capacity).to eq(100)
  end

  it "can change temperature after setting a level" do
    expect { chiller.set_level(5) }.to change(chiller, :temperature).from(70).to(45)
  end
end
