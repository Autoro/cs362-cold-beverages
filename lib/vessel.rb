class Vessel
  attr_reader :name
  attr_reader :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
  end

end
