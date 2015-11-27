class Bike
	attr_accessor :working

	def initialize
		@working = true
	end

	def report
		@working = false
		self
	end

	private

	def mend
		@working = true
	end

end
