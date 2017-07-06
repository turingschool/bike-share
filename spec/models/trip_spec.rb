RSpec.describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")

      expect(trip).to_not be_valid
    end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, end_date: "2013-08-29 14:14:00")

      expect(trip).to_not be_valid
    end

    it "is invalid without an end date" do
      trip = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00")

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station id" do
      trip = Trip.create(duration: 63, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station id" do
      trip = Trip.create(duration: 63, start_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type id" do
      trip = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")

      expect(trip).to_not be_valid
    end

    it "is valid with a all valid info" do
      trip = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")

      expect(trip).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to subscription" do
      t = Trip.reflect_on_association(:subscription)

      expect(t.macro).to eq(:belongs_to)
    end

    it "belongs to weather" do
      t = Trip.reflect_on_association(:weather)

      expect(t.macro).to eq(:belongs_to)
    end

    it ".subscription_type returns the related subscription object" do
      trip = Trip.create(duration: 109, start_station_id: 4, end_station_id: 5, bike_id: 679, zip_code: 95112, subscription_id: 1, start_date: "2013-08-29 13:25:00", end_date: "2013-08-29 13:27:00")
      subscriber = Subscription.create(subscription_type: "Subscriber")

      expect(trip.subscription).to eq(subscriber)
    end

    it ".weather returns related weather object" do
      trip = Trip.create(duration: 109, start_station_id: 4, end_station_id: 5, bike_id: 679, zip_code: 95112, subscription_id: 1, start_date: "2013-08-29 13:25:00", end_date: "2013-08-29 13:27:00", weather_id: 1)
      whether = Weather.create(date: "2013-08-29", max_temperature: 74.0, mean_temperature: 68.0, min_temperature: 61.0, mean_humidity: 75.0, mean_visibility: 10.0, mean_wind_speed: 11.0, precipitation: 1.0)

      expect(trip.weather).to eq(whether)
    end
  end
  describe "Class Methods" do
    before :each do
      Trip.create(duration: 109, start_station_id: 2, end_station_id: 6, bike_id: 679, zip_code: 95112, subscription_id: 1, start_date: "2013-08-29 13:25:00", end_date: "2013-08-29 13:27:00")
      Trip.create(duration: 113, start_station_id: 1, end_station_id: 6, bike_id: 318, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 17:01:00", end_date: "2013-08-29 17:03:00")
      Trip.create(duration: 71, start_station_id: 2, end_station_id: 2, bike_id: 48, zip_code: 97214, subscription_id: 1, start_date: "2013-08-29 10:16:00", end_date: "2013-08-29 10:17:00")
      Trip.create(duration: 70, start_station_id: 3, end_station_id: 1, bike_id: 48, zip_code: 95138, subscription_id: 1, start_date: "2013-08-29 14:42:00", end_date: "2013-08-29 14:43:00")
      Trip.create(duration: 63, start_station_id: 1, end_station_id: 6, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")
      Trip.create(duration: 569, start_station_id: 1, end_station_id: 5, bike_id: 318, zip_code: 32, subscription_id: 2, start_date: "2014-09-01 00:05:00", end_date: "2014-09-01 00:15:00")
      Subscription.create(subscription_type: "Subscriber")
      Subscription.create(subscription_type: "Customer")
      Station.create(name: "Santa Clara at Almaden", dock_count: 11, city_id: 191, installation_date: "2013-06-08")
      Station.create(name: "South Van Ness at Market", dock_count: 19, city_id: 195, installation_date: "2013-06-08")
      Station.create(name: "Mountain View City Hall", dock_count: 15, city_id: 193, installation_date: "2013-06-08")
      Station.create(name: "San Jose City Hall", dock_count: 15, city_id: 191, installation_date: "2013-06-08")
      Station.create(name: "Adobe on Almaden", dock_count: 19, city_id: 191, installation_date: "2013-05-08")
      Station.create(name: "5th at Howard", dock_count: 15, city_id: 195, installation_date: "2013-05-08")
    end

    describe ".average_duration" do
      it "returns average duration of trips" do
        expect(Trip.average_duration).to eq(0.16583e3)
      end
    end

    describe ".longest_ride" do
      it "returns longest duration" do
        expect(Trip.longest_ride).to eq(569)
      end
    end

    describe ".shortest_ride" do
      it "returns shortest duration" do
        expect(Trip.shortest_ride).to eq(63)
      end
    end

    describe ".start_station_with_most_rides" do
      it "returns station with most starting trips" do
        expect(Trip.start_station_with_most_rides).to eq("Santa Clara at Almaden")
      end
    end

    describe ".end_station_with_most_rides" do
      it "returns station with most ending trips" do
        expect(Trip.end_station_with_most_rides).to eq("Santa Clara at Almaden")
      end
    end

    describe ".most_ridden_bike" do
      it "returns bike id with most rides" do
        expect(Trip.most_ridden_bike).to eq(48)
      end
    end

    describe ".least_ridden_bikes" do
      it "returns bike id with least rides" do
        expect(Trip.least_ridden_bikes).to eq(679)
      end
    end

    describe ".subscription_info" do
      it "returns number of subscribers and customers" do
        expect(Trip.subscription_info.first).to eq([1, 5])
      end
    end

    describe "subscription_percentage" do
      it "returns percentage of subscribers and customers" do
        expect(Trip.subscription_percentage(4)).to eq(66.67)
      end
    end

    describe ".number_of_starting_rides_at_station" do
      it "returns number of rides starting at a station" do
        expect(Trip.number_of_starting_rides_at_station(1)).to eq(3)
      end
    end

    describe ".number_of_ending_rides_at_station" do
      it "returns number of rides ending at a station" do
        expect(Trip.number_of_ending_rides_at_station(5)).to eq(1)
      end
    end

    describe ".most_frequent_destination" do
      it "returns most frequent destination from this station" do
        expect(Trip.most_frequent_destination(1)).to eq("5th at Howard")
      end
    end

    describe ".most_frequent_origination" do
      it "returns most frequent origination to this station" do
        expect(Trip.most_frequent_origination(1)).to eq("Mountain View City Hall")
      end
    end

    describe ".date_with_highest_trip_from_this_station" do
      it "returns date with highest trip from this station" do
        expect(Trip.date_with_highest_trip_from_this_station(2)).to eq("8/29/2013")
      end
    end

    describe ".most_frequent_zip_code_users_starting" do
      it "returns zip code with most frequent starting rides" do
        expect(Trip.most_frequent_zip_code_users_starting(1)).to eq(94103)
      end
    end

    describe ".most_frequent_bike_starting" do
      it "returns bike id with most frequent starting ride" do
        expect(Trip.most_frequent_bike_starting(1)).to eq(318)
      end
    end
  end
end
