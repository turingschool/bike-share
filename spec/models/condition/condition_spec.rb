RSpec.describe Condition do
  context "Validations" do
    it "is invalid without date" do
      condition = Condition.create(
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               min_temperature_f: 75,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)
      expect(condition).to be_invalid
    end

    it "is invalid without max temperature" do
      condition = Condition.create(date: '2013-08-30',
                               mean_temperature_f: 80,
                               min_temperature_f: 75,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean temperature" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               min_temperature_f: 75,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean temperature" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without min temperature" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean humidity" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_visibility_miles: 3,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean visibility" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_wind_speed_mph: 15,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without mean wind speed" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               precipitation_inches: 0.5)

      expect(condition).to be_invalid
    end

    it "is invalid without precipitation" do
      condition = Condition.create(date: '2013-08-30',
                               max_temperature_f: 85,
                               mean_temperature_f: 80,
                               mean_humidity: 75,
                               mean_wind_speed_mph: 15)

      expect(condition).to be_invalid
    end
  end

  context "Class Methods" do
    before :each do
      @trip_1 = Trip.create(duration: 2000,
                  start_date: "2014-11-03",
                  start_station_id: 1,
                  end_date: "2015-10-02",
                  end_station_id: 2,
                  bike_id: 12,
                  subscription_type: "Subscriber",
                  zip_code: 80210)
      @trip_2 = Trip.create(duration: 3005,
                  start_date: "2014-11-04",
                  start_station_id: 2,
                  end_date: "2014-11-03",
                  end_station_id: 4,
                  bike_id: 2,
                  subscription_type: "Customer",
                  zip_code: 33156)
      @trip_3 = Trip.create(duration: 1000,
                  start_date: "2013-08-29",
                  start_station_id: 1,
                  end_date: "2013-08-29",
                  end_station_id: 2,
                  bike_id: 520,
                  subscription_type: 'Customer',
                  zip_code: 94127)
      @trip_4 = Trip.create(duration: 5200,
                  start_date: "2013-08-30",
                  start_station_id: 1,
                  end_date: "2013-08-29",
                  end_station_id: 2,
                  bike_id: 520,
                  subscription_type: 'Subscriber',
                  zip_code: 94127)
      @trip_5 = Trip.create(duration: 7522,
                  start_date: "2013-09-29",
                  start_station_id: 3,
                  end_date: "2013-08-29",
                  end_station_id: 1,
                  bike_id: 22,
                  subscription_type: 'Subscriber',
                  zip_code: 94127)
      @condition_1 = Condition.create(date: '2014-11-03',
                       max_temperature_f: 85.0,
                       mean_temperature_f: 80,
                       min_temperature_f: 75,
                       mean_humidity: 75,
                       mean_visibility_miles: 3,
                       mean_wind_speed_mph: 2,
                       precipitation_inches: 2)
      @conditions_2 = Condition.create(date: '2014-11-04',
                       max_temperature_f: 85.0,
                       mean_temperature_f: 80,
                       min_temperature_f: 75,
                       mean_humidity: 75,
                       mean_visibility_miles: 3,
                       mean_wind_speed_mph: 6,
                       precipitation_inches: 1.3)
      @conditions_3 = Condition.create(date: '2013-08-29',
                       max_temperature_f: 85,
                       mean_temperature_f: 80,
                       min_temperature_f: 75,
                       mean_humidity: 75,
                       mean_visibility_miles: 3,
                       mean_wind_speed_mph: 7,
                       precipitation_inches: 15)
      @conditions_4 = Condition.create(date: '2013-08-30',
                       max_temperature_f: 85,
                       mean_temperature_f: 80,
                       min_temperature_f: 75,
                       mean_humidity: 75,
                       mean_visibility_miles: 3,
                       mean_wind_speed_mph: 12,
                       precipitation_inches: 2.5)
      @conditions_5 = Condition.create(date: "2013-09-29",
                       max_temperature_f: 85,
                       mean_temperature_f: 80,
                       min_temperature_f: 75,
                       mean_humidity: 75,
                       mean_visibility_miles: 3,
                       mean_wind_speed_mph: 10,
                       precipitation_inches: 1)

    @station_1 = Station.create( name: 'Sandwich',
                                 city: "San Francisco",
                                 dock_count: 20,
                                 installation_date: "2017-08-06")

    @station_2 = Station.create( name: 'Burrito',
                                 city: "San Francisco",
                                 dock_count: 10,
                                 installation_date: "2011-10-06")

    @station_3 = Station.create( name: 'Lasagna',
                                 city: "Santa Cruz",
                                 dock_count: 7,
                                 installation_date: "2012-09-07")

    @station_4 = Station.create( name: 'Pizza',
                                 city: "Santa Cruz",
                                 dock_count: 32,
                                 installation_date: "2015-08-06")

    @station_5 = Station.create( name: 'Couscous',
                                 city: "Ocean Beach",
                                 dock_count: 20,
                                 installation_date: "2017-02-02")

    @station_6 = Station.create( name: 'Truffles',
                                 city: "Ocean Beach",
                                 dock_count: 25,
                                 installation_date: "2015-03-02")

    end

    describe '.days_within_high_temp' do
      it "returns days within temp range" do

        expect(Condition.days_within_high_temp(80.0,90.0)).to eq(5)
      end
    end

    describe '.days_within_precipitation' do
      it "returns days within a precipitation range" do
        expect(Condition.days_within_precipitation).to eq(9)
      end
    end

    describe '.days_within_wind' do
      it "returns days within a wind range mph" do
      end
    end

    describe '.days_within_visibility' do
      it "returns days within amount of miles" do
      end
    end

    describe '.rides_per_day' do
      it "groups all rides by weather type" do
      end
    end

    describe '.min_rides_temp' do
      it "returns lowest number of rides in temp range" do
      end
    end

    describe '.average_rides_temp' do
      it "returns average number of rides in temp range" do
      end
    end

    describe '.max_rides_temp' do
      it "returns highest number of rides in temp range" do
      end
    end

    describe '.min_rides_precip' do
      it "returns lowest number of rides in precip range" do
      end
    end

    describe '.average_rides_precip' do
      it "returns average number of rides in precip range" do
      end
    end

    describe '.max_rides_precip' do
      it "returns highest number of rides in precip range" do
      end
    end

    describe '.min_rides_wind' do
      it "returns lowest number of rides in wind range" do
      end
    end

    describe '.average_rides_wind' do
      it "returns average number of rides in wind range" do
      end
    end

    describe '.max_rides_wind' do
      it "returns highest number of rides in wind range" do
      end
    end

    describe '.min_rides_visibility' do
      it "returns lowest number of rides in visibility range" do
      end
    end

    describe '.average_rides_visibility' do
      it "returns average number of rides in visibility range" do
      end
    end

    describe '.max_rides_visibility' do
      it "returns highest number of rides in visibility range" do
      end
    end

    describe '.all_rides_within_wind_speed' do
      it "returns hash with date and ride numbers" do
      end
    end

    describe '.all_rides_within_visibility_range' do
      it "returns hash with date and rider numbers" do
      end
    end

    describe '.all_rides_within_temp_range' do
      it "returns hash with date and rider numbers" do
      end
    end

    describe '.weather_on_day_with_highest_rides' do
      it "returns conditions on days with highest rides" do
      end
    end

  end
end
