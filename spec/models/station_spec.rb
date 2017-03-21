require_relative '../spec_helper'

RSpec.describe Station do
  attr_reader :station1,
              :station2,
              :station3

  before :each do
    City.create(name:"Chicago")
    City.create(name:"Denver")
    Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160101", city_id: 1)
    Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
    Station.create(name: "New", dock_count: "10", installation_date: "20160303", city_id: 2)
  end

  describe "validations" do
    it "should be valid with all attributes" do
      expect(Station.first).to be_valid
    end

    it "should be invalid without name" do
      station = Station.create(dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without dock_count" do
      station = Station.create(name: "Navy Pier", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without city" do
      station = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203")

      expect(station).to_not be_valid
    end

    it "should be invalid without installation_date" do
      station = Station.create(name: "Navy Pier", dock_count: "10")

      expect(station).to_not be_valid
    end
  end

  describe "calculation methods" do
    it "#average_bikes should return 8" do
      expect(Station.average_bikes).to eq(9)
      expect(Station.average_bikes).not_to be_nil
    end

    it "#most_bikes should return 10" do
      expect(Station.most_bikes).to eq(10)
      expect(Station.most_bikes).not_to be_nil
    end

    it "#stations_by_most_docks should return station names" do
      expect(Station.stations_by_most_docks).to be_kind_of(String)
      expect(Station.stations_by_most_docks).to eq("Navy Pier, New")
    end

    it "#fewest_bikes should return 6" do
      expect(Station.fewest_bikes).to eq(6)
      expect(Station.fewest_bikes).not_to be_nil
    end

    it "#stations_by_least_docks should return station names" do
      expect(Station.stations_by_least_docks).to be_kind_of(String)
      expect(Station.stations_by_least_docks).to eq("Whatever")
    end

    it "#stations_by_install_date" do
      expect(Station.stations_by_install_date).to be_kind_of(Array)
      expect(Station.stations_by_install_date.first.name).to eq("New")
    end

    it "#newest_station should return a station name" do
      expect(Station.newest_station).to be_kind_of(Station)
      expect(Station.newest_station.name).to eq("New")
    end

    it "#oldest_station should return a station object" do
      expect(Station.oldest_station).to be_kind_of(Station)
      expect(Station.oldest_station.name).to eq("Navy Pier")
    end
  end
end
