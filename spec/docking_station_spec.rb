require 'docking_station'

describe DockingStation do
	it { is_expected.to respond_to :release_bike }

	describe '#release_bike' do
		it 'release bike' do
			bike = double(:bike)
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises error when there are no bikes' do
			expect { subject.release_bike }.to raise_error 'No bikes available!'
		end
	end

	describe '#dock' do
		it 'raises an error when full' do
			DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
			expect {subject.dock double(:bike)}.to raise_error 'Docking station full!'
		end
	end

	it 'is bike docked' do
		bike = double(:bike)
		expect(subject.dock(bike)).to eq subject.bikes
	end

	it 'docking station full' do
		DockingStation::DEFAULT_CAPACITY.times{subject.dock double(:bike)}
		expect(subject.count).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'is initialized with @capacity' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

 it 'defaults to default capacity if capacity is not passed' do
	 bike = double(:bike)
	 described_class::DEFAULT_CAPACITY.times do
		 subject.dock(bike)
	 end
	 expect{ subject.dock(bike) }.to raise_error 'Docking station full!'
 end

 it 'does not release bikes that are not working' do
	 bike = double(:bike)
	 bike.report
	 subject.dock(bike)
 	 expect{ subject.release_bike }.to raise_error "Sorry mate- it's broken"
 end
end
