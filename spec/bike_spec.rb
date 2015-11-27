require 'bike'

describe Bike do

	it "should respond to method working?" do
		expect(subject).to respond_to :working
	end

	it "should be able to report bike as broken" do
		subject.report
		expect(subject.working).to eq false
	end
end
