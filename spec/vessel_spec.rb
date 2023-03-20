require_relative '../lib/vessel'

describe 'A vessel for holding liquid' do
  let(:vessel) { Vessel.new("FAKE", 100) }

  it 'has a name, volume, and current_volume' do
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
    expect(vessel.current_volume).to eq(0)
  end

  it 'is initially empty' do
    expect(vessel).to be_empty
  end

  it 'is no longer empty when we fill it' do
    vessel.fill
    expect(vessel).to_not be_empty
  end

  it "cannot be filled beyond its volume" do
    vessel.fill(vessel.volume + 1)
    expect(vessel.current_volume).to eq(vessel.volume)
  end
end
