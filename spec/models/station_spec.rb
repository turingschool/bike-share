require_relative "../spec_helper"

RSpec.describe Station do
  describe "knows attributes" do
    it "returns station name" do
      station = Station.create(name: "Denver Station", city_id: 1, dock_count: 25, installation_date: "8/6/2013")
      result = station.name
      expect(result).to eq("Denver Station")
    end
    it "returns city name" do
        station = Station.create(name: "Denver Station", city_id: 1, dock_count: 25, installation_date: "8/6/2013")
        result = station.city_id
        expect(result).to eq(1)
    end
    it "returns dock count" do
      station = Station.create(name: "Denver Station", city_id: 1, dock_count: 25, installation_date: "8/6/2013")
        result = station.dock_count
        expect(result).to eq(25)
    end
    it "returns installation date" do
      station = Station.create(name: "Denver Station", city_id: 1, dock_count: 25, installation_date:"8/6/2013")
        result = station.installation_date
        expect(result).to eq (Date.strptime("8/6/2013", '%d/%m/%Y'))
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      station = Station.new(city_id: 1, dock_count: 25, installation_date:"Fri, 11 Apr 2014")
      expect(station).to_not be_valid
    end
    it "is invalid without a city id" do
      station = Station.new(name: "Denver Station", dock_count: 25, installation_date:"Fri, 11 Apr 2014")
      expect(station).to_not be_valid
    end
    it "is invalid without a dock count" do
      station = Station.new(name: "Denver Station", installation_date: "Fri, 11 Apr 2014")
      expect(station).to_not be_valid
    end
    it "is invalid without a installation date" do
      station = Station.new(name: "Denver Station", dock_count: 25)
      expect(station).to_not be_valid
    end

    it "should be valid with all attributes" do
      station = Station.new(name: "Denver Station", city_id: 1, dock_count: 25, installation_date: "8/6/2013")
      expect(station).to be_valid
      station =  Station.new(name: "Denver Station",  dock_count: 25, installation_date: "8/6/2013")
      expect(station).to_not be_valid
    end
  end
end
