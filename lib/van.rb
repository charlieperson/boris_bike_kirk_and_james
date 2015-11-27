require_relative "docking_station"
require_relative "garage"

class Van
  attr_reader :van_bikes

  def initialize
    @van_bikes = []
  end

  def deliver(garage)
    garage.garage_bikes.flatten << @van_bikes
    @van_bikes = []
  end
end
