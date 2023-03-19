class Vessel
  attr_reader :name
  attr_reader :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @current_volume = 0
  end

  def empty?
    @current_volume == 0
  end
end
