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

      expect(Station.max_available_bikes).to eq(37)

    end
  end


end
