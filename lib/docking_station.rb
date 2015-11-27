require_relative 'bike'

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
		raise "Sorry mate- it's broken" unless broke
		@bikes.pop
	end

	def dock(bike)
		fail 'Docking station full!' if full?
		@bikes << bike
	end

	def count
		@bikes.length
	end

	private

	def broke
		@bikes.last.working
	end

	def full?
		@bikes.length >= @capacity
	end

	def empty?
		@bikes.empty?
	end

end
