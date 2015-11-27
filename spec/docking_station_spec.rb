require 'docking_station'

describe DockingStation do
	let(:bike) { double :bike }

	it { is_expected.to respond_to :release_bike }

	it 'release bike' do
		allow(bike).to receive(:working) {true}
		subject.dock(bike)
		expect(subject.release_bike).to eq bike
	end

	it 'raises error when there are no bikes' do
		expect { subject.release_bike }.to raise_error 'No bikes available!'
	end


	describe '#dock' do
		it 'raises an error when full' do
			DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
			expect {subject.dock bike}.to raise_error 'Docking station full!'
		end
	end

	it 'is bike docked' do
		expect(subject.dock(bike)).to eq subject.bikes
	end

	it 'docking station full' do
		DockingStation::DEFAULT_CAPACITY.times{subject.dock(bike)}
		expect(subject.count).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'is initialized with @capacity' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'defaults to default capacity if capacity is not passed' do
		described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
		expect{ subject.dock(bike) }.to raise_error 'Docking station full!'
	end

	it 'does not release bikes that are not working' do
		subject.dock(double(:broken_bike, working: false))
		expect{ subject.release_bike }.to raise_error "Sorry mate- it's broken"
	end
end
