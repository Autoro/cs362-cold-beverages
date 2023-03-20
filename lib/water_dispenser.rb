class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    volume_to_dispense = reservoir.current_water_volume < vessel.volume ? reservoir.current_water_volume : vessel.volume 

    reservoir.drain(volume_to_dispense)
    vessel.fill(volume_to_dispense)
  end

end
