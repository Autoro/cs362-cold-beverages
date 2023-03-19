require_relative '../lib/freezer'

describe 'A freezer' do
  let(:freezer) { Freezer.new(100) }

  it "has a capacity and temperature" do
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end
end
