require_relative "bike"


class Garage
  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  def fix
    @garage_bikes.map {|bike| bike.working = true}
  end

  def give_back(station)
    station.bikes.flatten << @garage_bikes
    @garage_bikes = []
  end
end
