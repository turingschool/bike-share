require 'spec_helper'

RSpec.describe Condition do
  describe "Class Methods" do
    it "can find a Condition ID when given a date" do
      Condition.create(date: "2013-08-29", max_temperature: 74, mean_temperature: 68, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)

      expect(Condition.date_id("29/08/2013")).to eql(1)
    end

    it "can find most rides given weather conditions" do
      Condition.create(date: "2013-08-29", max_temperature: 74, mean_temperature: 68, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)
      Condition.create(date: "2013-08-30", max_temperature: 76, mean_temperature: 70, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)

      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127, condition_id: 1)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 94127, condition_id: 1)
      Trip.create(duration: 71, start_date: "30/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 94127, condition_id: 2)

       expect(Condition.max_weather_ride_analytics(:max_temperature, 70, 79)).to eql(2)
    end

    it "can find least rides given weather conditions" do
      Condition.create(date: "2013-08-29", max_temperature: 74, mean_temperature: 68, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)
      Condition.create(date: "2013-08-30", max_temperature: 76, mean_temperature: 70, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)

      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127, condition_id: 1)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 94127, condition_id: 1)
      Trip.create(duration: 71, start_date: "30/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 94127, condition_id: 2)

       expect(Condition.min_weather_ride_analytics(:max_temperature, 70, 79)).to eql(1)
    end

    it "can find average rides given weather conditions" do
      Condition.create(date: "2013-08-29", max_temperature: 74, mean_temperature: 68, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)
      Condition.create(date: "2013-08-30", max_temperature: 76, mean_temperature: 70, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)
      Condition.create(date: "2013-08-31", max_temperature: 75, mean_temperature: 69, min_temperature: 61, mean_humidity: 75, mean_visibility: 10, mean_wind_speed: 11, precipitation: 0, zip_code: 94127)

      Trip.create(duration: 63, start_date: "31/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 66, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 66, bike_id: 520, subscription: "Subscriber", zip_code: 94127, condition_id: 1)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 10, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 10, bike_id: 661, subscription: "Subscriber", zip_code: 94127, condition_id: 2)
      Trip.create(duration: 71, start_date: "30/8/2013", start_station_name: "Mountain View City Hall", start_station_id: 27, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 27, bike_id: 48, subscription: "Subscriber", zip_code: 94127, condition_id: 3)

       expect(Condition.avg_weather_ride_analytics(:max_temperature, 70, 79)).to eql(1)
    end
  end
end
