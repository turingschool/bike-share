require_relative '../spec_helper'

RSpec.describe Condition do
  before :each do
    SubscriptionType.create(flavor: "Subscriber")
    City.create(name: "Denver")
    Station.create(id: 7, name: "East station", installation_date: 20150331, dock_count: 45, city_id: 1)
    Trip.create(duration: 39,
                start_date: format_date("12/15/2013 14:54"),
                start_station_id: 4,
                end_date: format_date("12/15/2013 15:56"),
                bike_id: 6,
                end_station_id: 7,
                subscription_type_id: 1
                )
    Trip.create(duration: 39,
                start_date: format_date("12/16/2013 14:54"),
                start_station_id: 4,
                end_date: format_date("12/16/2013 15:56"),
                bike_id: 6,
                end_station_id: 7,
                subscription_type_id: 1
                )
    Trip.create(duration: 39,
                start_date: format_date("12/16/2013 14:54"),
                start_station_id: 4,
                end_date: format_date("12/16/2013 15:56"),
                bike_id: 6,
                end_station_id: 7,
                subscription_type_id: 1
                )
    Trip.create(duration: 39,
                start_date: format_date("12/18/2013 14:54"),
                start_station_id: 4,
                end_date: format_date("12/18/2013 15:56"),
                bike_id: 6,
                end_station_id: 7,
                subscription_type_id: 1
                )
    @condition = Condition.create(date: format_date("12/15/2013"),
                max_temperature_f: 4,
                mean_temperature_f: 6,
                min_temperature_f: 32,
                mean_humidity: 12,
                mean_visibility_miles: 1,
                mean_wind_speed_mph: 23,
                precipitation_inches: 1,
                zip_code: 94127
                )
    Condition.create(date: format_date("12/16/2013"),
                max_temperature_f: 4,
                mean_temperature_f: 6,
                min_temperature_f: 32,
                mean_humidity: 12,
                mean_visibility_miles: 1,
                mean_wind_speed_mph: 23,
                precipitation_inches: 1,
                zip_code: 94127
                )
    Condition.create(date: format_date("12/18/2013"),
                max_temperature_f: 50,
                mean_temperature_f: 6,
                min_temperature_f: 32,
                mean_humidity: 12,
                mean_visibility_miles: 1,
                mean_wind_speed_mph: 23,
                precipitation_inches: 1,
                zip_code: 94127
                )
  end
  describe "validations" do
    it "should be valid with all attributes" do
      expect(@condition).to be_valid
    end
  end
  describe "methods" do
    it "#highest_ride_weather" do
      expect(Condition.highest_ride_weather.first).to be_kind_of(Condition)
    end
    it "#fewest_ride_weather" do
      expect(Condition.fewest_ride_weather.first).to be_kind_of(Condition)
    end

    it "#trips_per_day should return a number" do
      expect(Condition.trips_per_day(format_date("12/16/2013"))).to be_kind_of(Integer)
      expect(Condition.trips_per_day(format_date("12/16/2013"))).to eq(2)
    end

    it "#range_of_trips knows its trip number" do
      expect(Condition.number_of_trips_per_temperature_range).to be_kind_of(Hash)
    end

    it "#get_averages_from_range returns array of floats" do
      expect(Condition.get_averages_from_range).to eq([1.5, nil, 1.0])
    end
  end

end
