RSpec.describe Weather do
  describe "Validations" do
    it "is invalid without a date" do
      weather = Weather.new(max_temperature: 74.0, mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(weather).to_not be_valid
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
