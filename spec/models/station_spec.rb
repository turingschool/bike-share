require './spec/spec_helper'

RSpec.describe Station do
  describe ".average_available_bikes" do
    it "returns the average available bikes per station" do
      Loader.new('./spec/fixtures/station_fixtures.csv').load_stations

      expect(Station.average_available_bikes).to eq(16)
    end
  end

  describe ".max_available_bikes" do
    it "returns the maximum number of bikes at a station" do
      Loader.new('./spec/fixtures/station_fixtures.csv').load_stations

      expect(Station.max_available_bikes).to eq(27)
    end
  end

  describe ".max_bike_station" do
    it "returns the name of the station with maximum number available bikes" do
      Loader.new('./spec/fixtures/station_fixtures.csv').load_stations

      expect(Station.max_bike_station).to eq("San Jose Diridon Caltrain Station")
    end
  end

  describe ".min_avaiable_bikes" do
    it "returns the smallest number of bikes available at a station" do
      Loader.new('./spec/fixtures/station_fixtures.csv').load_stations

      expect(Station.min_available_bikes).to eq(11)
    end
  end

  describe ".min_bike_station"
    it "returns the name of the station with minimum number of bikes availble bikes" do
      Loader.new('./spec/fixtures/station_fixtures.csv').load_stations

      expect(Station.min_bike_station).to eq("Santa Clara at Almaden")
    end
  end
  
end
