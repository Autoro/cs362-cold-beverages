require_relative 'chiller'

class FakeChiller < Chiller
  attr_reader :power, :contents
end