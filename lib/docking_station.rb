require_relative 'bike'
require_relative 'van'

class DockingStation
	DEFAULT_CAPACITY = 20

	attr_reader :bikes
	attr_accessor :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes = []
	end

	def release_bike
		fail 'No bikes available!' if empty?
		raise "Sorry mate- it's broken" unless last_working?
		@bikes.pop
	end

	def dock(bike)
		fail 'Docking station full!' if full?
		@bikes << bike
	end

	def collect(van)
		van.van_bikes.flatten << @bikes.delete_if{|x| !x.working}
	end

	def count
		@bikes.length
	end

	private

	def last_working?
		@bikes.last.working
	end

	def full?
		@bikes.length >= @capacity
	end

	def empty?
		@bikes.empty?
	end

end
