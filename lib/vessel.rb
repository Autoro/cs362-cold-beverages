class Vessel
  attr_reader :name, :volume, :current_volume

  def initialize(name, volume, initial_volume = 0)
    @name = name
    @volume = volume
    @current_volume = initial_volume
  end

  def empty?
    @current_volume <= 0
  end

  def fill(amount = @volume)
    @current_volume += volume
    if (@current_volume > @volume)
      @current_volume = @volume
    end
  end
end
