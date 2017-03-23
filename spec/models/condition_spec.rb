require_relative '../spec_helper'

RSpec.describe Condition do
  describe "attributes" do
    it "should respond to date, max_temp, mean_temp, min_temp, mean_humidity, mean_visibility, mean_wind and precipitation" do
      condition = Condition.create(date: "8/29/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)

      expect(condition).to respond_to(:date, :max_temp, :mean_temp, :min_temp, :mean_humidity, :mean_visibility, :mean_wind, :precipitation)
    end
  end

  describe ".trips_by_max_temp" do
    it "should create trips by max temp range" do
      condition = Condition.create(date: "4/09/2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "4/11/2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1)

      expect(Condition.trips_by_max_temp).to be_a(Hash)
      expect(Condition.trips_by_max_temp[70].first).to be_a(Condition)

    end
  end

  describe ".average_rides_max_temp" do
    it "should create hash of average ride for max temp ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.average_rides_max_temp).to be_a(Hash)
      expect(Condition.average_rides_max_temp[70]).to eq(3.0)

    end
  end

  describe ".max_rides_max_temp" do
    it "should create hash of max rides for max temp ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.max_rides_max_temp).to be_a(Hash)
      expect(Condition.max_rides_max_temp[70]).to eq(4)

    end
  end

  describe ".min_rides_max_temp" do
    it "should create hash of min rides for max temp ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.min_rides_max_temp).to be_a(Hash)
      expect(Condition.min_rides_max_temp[70]).to eq(2)

    end
  end

  describe ".average_rides_precipitation" do
    it "should create hash of average ride for precipitation ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.average_rides_precipitation).to be_a(Hash)
      expect(Condition.average_rides_precipitation[0.0]).to eq(3.0)

    end
  end

  describe ".max_rides_precipitation" do
    it "should create hash of max rides for precipitation ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.max_rides_precipitation).to be_a(Hash)
      expect(Condition.max_rides_precipitation[0.0]).to eq(4)

    end
  end

  describe ".min_rides_precipitation" do
    it "should create hash of min rides for precipitation ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.min_rides_precipitation).to be_a(Hash)
      expect(Condition.min_rides_precipitation[0.0]).to eq(2)

    end
  end

  describe ".average_rides_wind" do
    it "should create hash of average rides for wind speed ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.average_rides_wind).to be_a(Hash)
      expect(Condition.average_rides_wind[8.0]).to eq(4.0)

    end
  end

  describe ".max_rides_wind" do
    it "should create hash of max rides for wind speed ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.max_rides_wind).to be_a(Hash)
      expect(Condition.max_rides_wind[8.0]).to eq(4)

    end
  end

  describe ".min_rides_wind" do
    it "should create hash of the min rides for wind speed ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.min_rides_wind).to be_a(Hash)
      expect(Condition.min_rides_wind[12.0]).to eq(2)

    end
  end

  describe ".average_rides_visibility" do
    it "should create hash of average rides for visibility ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 4.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.average_rides_visibility).to be_a(Hash)
      expect(Condition.average_rides_visibility[4.0]).to eq(4.0)

    end
  end

  describe ".max_rides_visibility" do
    it "should create hash of max rides for visibility ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 6.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 8.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.max_rides_visibility).to be_a(Hash)
      expect(Condition.max_rides_visibility[4.0]).to eq(4)

    end
  end

  describe ".min_rides_visibility" do
    it "should create hash of the min rides for visibility ranges" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 4.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.min_rides_visibility).to be_a(Hash)
      expect(Condition.min_rides_visibility[8.0]).to eq(2)

    end
  end

  describe ".conditions_for_busiest_day" do
    it "should return conditions for the busiest day for trips" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 4.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.conditions_for_busiest_day).to be_a(Condition)
      expect(Condition.conditions_for_busiest_day.date.to_s).to eq("2014-04-09")

    end
  end

  describe ".conditions_for_least_busy_day" do
    it "should return conditions for the least busy day for trips" do
      condition = Condition.create(date: "Wed, 09 Apr 2014", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 4.0, mean_wind: 11.0, precipitation: 0.0)
      condition = Condition.create(date: "Fri, 11 Apr 2014", max_temp: 76.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 13.0, precipitation: 0.4)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 60, start_date: "Fri, 11 Apr 2014", start_station_id: 1, end_date: "Fri, 11 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 2)
      Trip.create(duration: 40, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)
      Trip.create(duration: 110, start_date: "Wed, 09 Apr 2014", start_station_id: 1, end_date: "Wed, 09 Apr 2014", end_station_id: 1, bike_id: 1, subscription_type_id: 1, condition_id: 1)

      expect(Condition.conditions_for_least_busy_day).to be_a(Condition)
      expect(Condition.conditions_for_least_busy_day.date.to_s).to eq("2014-04-11")

    end
  end
end