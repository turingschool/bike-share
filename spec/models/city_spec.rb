require './spec/spec_helper'

RSpec.describe City do
  it "has a name attribute" do
    city = City.create(name:"squeevillia")

    expect(city.id).to eq 1
    expect(city.name).to eq "squeevillia"
  end

  it "cannot be made without a name" do
    city = City.create

    expect(city).to be_invalid
  end

  it "city has stations" do
    city = City.create(name: "squeevillia")
    station = city.stations.create(dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

    expect(station.city.name).to eq "squeevillia"

  end
end
