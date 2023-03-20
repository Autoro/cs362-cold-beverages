require_relative '../lib/chiller'

class TestChiller < Chiller
  attr_reader :power
end

describe 'A chiller' do
  let(:chiller) { TestChiller.new(100) }

  it "has a capacity and temperature" do
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it "can be turned on" do
    expect { chiller.turn_on }.to change(chiller, :power).from(:off).to(:on)
  end
end
