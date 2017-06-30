require './spec/spec_helper'

RSpec.describe EndStation do
  describe "attributes" do
    it "returns value in id columns" do
      city = City.create(name: "San Jose")
      station_1 = Station.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
      station_2 = Station.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
      end_station = EndStation.create(station_id: 2)

      expect(end_station.id).to eq(1)
    end
  end

  describe "validations" do
    it "is invalid without a station_id" do
      end_station = EndStation.create(station_id: nil)

      expect(end_station).to be_invalid
    end
  end

  describe "access to stations" do
    it "can access station name" do
      city = City.create(name: "San Jose")
      station_1 = Station.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
      station_2 = Station.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
      end_station = EndStation.create(station_id: 2)

      expect(end_station.station.name).to eq("Cesar Chavez Station")
    end
  end
end