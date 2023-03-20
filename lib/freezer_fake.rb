require_relative 'freezer'

class TestFreezer < Freezer
  attr_reader :power, :contents
end