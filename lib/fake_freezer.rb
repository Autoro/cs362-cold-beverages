require_relative 'freezer'

class FakeFreezer < Freezer
  attr_reader :power, :contents
end