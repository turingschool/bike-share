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
    it ".highest_rides" do
      highest_rides = Weather.highest_rides("max_temperature", 10)
      expected = {[50, 60] => 3,[60, 70] => 2,[70, 80] => 3}
      expect(highest_rides).to eq(expected)
    end
    it ".lowest_rides" do
      lowest_rides = Weather.lowest_rides("max_temperature", 10)
      expected = {[50, 60] => 3,[60, 70] => 2,[70, 80] => 1}
      expect(lowest_rides).to eq(expected)
    end
    it ".calculate_rides" do
      expected = {"average" => {[50, 60] => 3,[60, 70] => 2,[70, 80] => 2},
                  "highest" => {[50, 60] => 3,[60, 70] => 2,[70, 80] => 3},
                  "lowest" =>  {[50, 60] => 3,[60, 70] => 2,[70, 80] => 1}}
      expect(Weather.calculate_rides("max_temperature", 10)).to eq(expected)
    end
    it ".rides_by_max_temp" do
      expected = {"average" => {[50, 60] => 3,[60, 70] => 2,[70, 80] => 2},
                  "highest" => {[50, 60] => 3,[60, 70] => 2,[70, 80] => 3},
                  "lowest" =>  {[50, 60] => 3,[60, 70] => 2,[70, 80] => 1}}
      expect(Weather.rides_by_max_temp).to eq(expected)
    end
    it ".rides_by_precipitation" do
      expected = {"average" => {[0.0, 0.5] => 2,[1.0, 1.5] => 3,[5.5, 6.0] => 2},
                  "highest" => {[0.0, 0.5] => 2,[1.0, 1.5] => 3,[5.5, 6.0] => 3},
                  "lowest" =>  {[0.0, 0.5] => 2,[1.0, 1.5] => 3,[5.5, 6.0] => 1}}
      expect(Weather.rides_by_precipitation).to eq(expected)
    end
    it ".rides_by_mean_wind_speed" do
      expected = {"average" => {[8, 12] => 3,[12, 16] => 2},
                  "highest" => {[8, 12] => 3,[12, 16] => 3},
                  "lowest" =>  {[8, 12] => 3,[12, 16] => 1}}
      expect(Weather.rides_by_mean_wind_speed).to eq(expected)
    end
    it ".rides_by_mean_visibility" do
      expected = {"average" => {[8, 12] => 2,[20, 24] => 3},
                  "highest" => {[8, 12] => 3,[20, 24] => 3},
                  "lowest" =>  {[8, 12] => 1,[20, 24] => 3}}
      expect(Weather.rides_by_mean_visibility).to eq(expected)
    end
    it ".highest_rides_weather" do
      expect(Weather.highest_rides_weather["max_temperature"]).to eq(55.0)
    end
    it ".lowest_rides_weather" do
      expect(Weather.lowest_rides_weather["max_temperature"]).to eq(77.0)
    end
  end
  describe "Relationships" do
    it ".trips returns all trips" do
      trip1 = Trip.create(duration: 113, start_station_id: 66, end_station_id: 66, bike_id: 318, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 17:01:00", end_date: "2013-08-29 17:03:00", weather_id: 1)
      trip2 = Trip.create(duration: 71, start_station_id: 27, end_station_id: 27, bike_id: 48, zip_code: 97214, subscription_id: 1, start_date: "2013-08-29 10:16:00", end_date: "2013-08-29 10:17:00", weather_id: 1)
      trip3 = Trip.create(duration: 70, start_station_id: 10, end_station_id: 10, bike_id: 48, zip_code: 95138, subscription_id: 1, start_date: "2013-08-29 14:42:00", end_date: "2013-08-29 14:43:00", weather_id: 1)
      trip4 = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00", weather_id: 1)
      trip5 = Trip.create(duration: 569, start_station_id: 66, end_station_id: 57, bike_id: 318, zip_code: 32, subscription_id: 2, start_date: "2014-09-01 00:05:00", end_date: "2014-09-01 00:15:00", weather_id: 1)
      weather = Weather.create(date: "2013-08-29", max_temperature: 74.0, mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather.trips.count).to eq(5)
      expect(weather.trips).to eq([trip1, trip2, trip3, trip4, trip5])
    end
  end
end
