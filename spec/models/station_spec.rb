require './spec/spec_helper'


RSpec.describe Station do
  xdescribe "it exists" do
    it "is class Station" do
      expect(Station).to eq Station
    end
  end

  it "is invalid without a name" do
    station = Station.new(name: "something")

    expect(station).to be_invalid
  end
end
