require_relative '../lib/freezer'

class TestFreezer < Freezer
  attr_reader :power
end

describe 'A freezer' do
  let(:freezer) { TestFreezer.new(100) }

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
end
