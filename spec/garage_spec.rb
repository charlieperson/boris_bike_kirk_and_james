require "garage"

describe Garage do

  it "fixes bikes" do
    broke = Bike.new
    subject.garage_bikes << broke.report
    subject.fix
    expect(subject.garage_bikes.all?{|x| x.working}).to eq true
  end

  it "delivers bikes back to docking station" do
    subject.garage_bikes << double(:bike)
    subject.give_back(double(:docking_station, bikes: []))
    expect(subject.garage_bikes).to eq []
  end


end
