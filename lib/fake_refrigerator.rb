require_relative 'refrigerator'

class FakeRefrigerator < Refrigerator
  attr_reader :power
end