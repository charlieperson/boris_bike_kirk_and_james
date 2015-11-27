require "van"

describe Van do
  let(:station) {double :station}

  it "Ensure all bikes in van are broken" do
    expect(subject.van_bikes.all? {|x| !x.working}).to eq true
  end

  it "delivers bikes to garage" do
    subject.van_bikes << double(:bike)
    subject.deliver(double(:garage, :garage_bikes => []))
    expect(subject.van_bikes).to eq([])
  end

end
