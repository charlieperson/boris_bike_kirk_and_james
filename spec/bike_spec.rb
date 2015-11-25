require 'bike'

describe Bike do
	it "should respond to method working?" do
		expect(subject).to respond_to :working?
	end
end
