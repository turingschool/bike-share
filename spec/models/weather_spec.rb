require './db/seeds.rb'

RSpec.describe Weather do
  describe "Validations" do
    it "is invalid without a date" do
      weather = Weather.new(max_temperature: 74.0, mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
    end
  end
  describe "Class Methods" do
    before :each do
      seed_city_database("db/fixtures/stations.csv")
      seed_weather_database("db/fixtures/weather.csv")
      seed_station_database("db/fixtures/stations.csv")
      seed_subscriptions_database("db/fixtures/trips.csv")
      seed_trips_database("db/fixtures/trips.csv")
    end
    it ".average_rides" do
      average_rides = Weather.average_rides("max_temperature", 10)
      expected = {[50, 60] => 3,[60, 70] => 2,[70, 80] => 2}
      expect(average_rides).to eq(expected)
    end
  end
end
