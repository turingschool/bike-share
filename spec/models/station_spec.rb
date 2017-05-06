require './spec/spec_helper'


RSpec.describe Station do
  it "has all attributes" do
    station = Station.create(name: "something", dock_count: 1, city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

    expect(station.id).to eq 1
    expect(station.name).to eq "something"
    expect(station.dock_count).to eq 1
    expect(station.city_id).to eq 1
    expect(station.installation_date).to eq Date.strptime("08/30/2013",'%m/%d/%Y')
    expect(station.longitude).to eq -121.9
    expect(station.latitude).to eq 30.7
  end

  it "is invalid without a name" do
    station = Station.create(dock_count: 1, city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

    expect(station).to be_invalid
  end

  it "is invalid without a dock_count" do
    station = Station.create(name: "something", city_id: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

    expect(station).to be_invalid
  end

  it "is invalid without a city_id" do
    station = Station.create(name: "something", dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9, latitude: 30.7)

    expect(station).to be_invalid
  end

  it "is invalid without a installation_date" do
    station = Station.create(name: "something", city_id: 1, dock_count: 1, longitude: -121.9, latitude: 30.7)

    expect(station).to be_invalid
  end

  it "is invalid without a longitude" do
    station = Station.create(name: "something", city_id: 1, dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), latitude: 30.7)

    expect(station).to be_invalid
  end

  it "is invalid without a latitude" do
    station = Station.create(name: "something", city_id: 1, dock_count: 1, installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), longitude: -121.9)

    expect(station).to be_invalid
  end
end
