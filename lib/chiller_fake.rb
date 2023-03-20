require_relative 'chiller'

class TestChiller < Chiller
  attr_reader :power, :contents
end