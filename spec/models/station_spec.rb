require_relative '../spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "should be valid with all attributes" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(station).to be_valid
    end

    it "should be invalid without name" do
      City.create(name:"Chicago")
      station = Station.create(dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without dock_count" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without city" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203")

      expect(station).to_not be_valid
    end

    it "should be invalid without installation_date" do
      City.create(name:"Chicago")
      station = Station.create(name: "Navy Pier", dock_count: "10")

      expect(station).to_not be_valid
    end
  end

  describe "calculation methods" do
    it "#average_bikes should return 8" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)
      station2 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)

      expect(Station.average_bikes).to eq(8)
      expect(Station.average_bikes).not_to be_nil
    end

    it "#most_bikes should return 10" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)
      station2 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)

      expect(Station.most_bikes).to eq(10)
      expect(Station.most_bikes).not_to be_nil
    end

    it "#stations_by_most_docks should return station names" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
      station2 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)
      station3 = Station.create(name: "New", dock_count: "10", installation_date: "20160303", city_id: 2)


      expect(Station.stations_by_most_docks).to be_kind_of(String)
      expect(Station.stations_by_most_docks).to eq("Navy Pier, New")
    end

    it "#fewest_bikes should return 6" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)
      station2 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)

      expect(Station.fewest_bikes).to eq(6)
      expect(Station.fewest_bikes).not_to be_nil
    end

    it "#stations_by_least_docks should return station names" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
      station3 = Station.create(name: "Whatever2", dock_count: "6", installation_date: "20160203", city_id: 2)
      station2 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(Station.stations_by_least_docks).to be_kind_of(String)
      expect(Station.stations_by_least_docks).to eq("Whatever, Whatever2")
    end

    it "#stations_by_install_date" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
      station2 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160204", city_id: 1)

      expect(Station.stations_by_install_date).to be_kind_of(Array)
      expect(Station.stations_by_install_date.first.name).to eq("Navy Pier")
    end

    it "#newest_station should return a station name" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
      station2 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160204", city_id: 1)

      expect(Station.newest_station).to be_kind_of(Station)
      expect(Station.newest_station.name).to eq("Navy Pier")
    end

    it "#oldest_station should return a station object" do
      City.create(name:"Chicago")
      City.create(name:"Denver")
      station1 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
      station2 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160204", city_id: 1)

      expect(Station.oldest_station).to be_kind_of(Station)
      expect(Station.oldest_station.name).to eq("Whatever")
    end
  end
end
