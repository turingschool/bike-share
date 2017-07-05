RSpec.describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.new(start_date: 12, start_station_id: 12, end_date: 12, end_station_id: 12, bike_id: 12, subscription_type_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start date" do
      trip = Trip.new(duration: 12, start_station_id: 12, end_date: 12, end_station_id: 12, bike_id: 12, subscription_type_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end date" do
      trip = Trip.new(duration: 12, start_date: 12, start_station_id: 12, end_station_id: 12, bike_id: 12, subscription_type_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station id" do
      trip = Trip.new(duration: 12, start_date: 12, end_date: 12, end_station_id: 12, bike_id: 12, subscription_type_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end station id" do
      trip = Trip.new(duration: 12, start_date: 12, start_station_id: 12, end_date: 12, bike_id: 12, subscription_type_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      trip = Trip.new(duration: 12, start_date: 12, start_station_id: 12, end_date: 12, end_station_id: 12, subscription_type_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type id" do
      trip = Trip.new(duration: 12, start_date: 12, start_station_id: 12, end_date: 12, end_station_id: 12, bike_id: 12)

      expect(trip).to_not be_valid
    end
  end
  describe "Class Methods" do
    before :each do
      Trip.create(duration: 109, start_station_id: 4, end_station_id: 5, bike_id: 679, zip_code: 95112, subscription_id: 1, start_date: "2013-08-29 13:25:00", end_date: "2013-08-29 13:27:00")
      Trip.create(duration: 113, start_station_id: 66, end_station_id: 66, bike_id: 318, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 17:01:00", end_date: "2013-08-29 17:03:00")
      Trip.create(duration: 71, start_station_id: 27, end_station_id: 27, bike_id: 48, zip_code: 97214, subscription_id: 1, start_date: "2013-08-29 10:16:00", end_date: "2013-08-29 10:17:00")
      Trip.create(duration: 70, start_station_id: 10, end_station_id: 10, bike_id: 48, zip_code: 95138, subscription_id: 1, start_date: "2013-08-29 14:42:00", end_date: "2013-08-29 14:43:00")
      Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00")
      Trip.create(duration: 569, start_station_id: 66, end_station_id: 57, bike_id: 318, zip_code: 32, subscription_id: 2, start_date: "2014-09-01 00:05:00", end_date: "2014-09-01 00:15:00")
      Subscription.create(subscription_type: "Subscriber")
      Subscription.create(subscription_type: "Customer")
      Station.create(Station id: 4, name: "Santa Clara at Almaden", dock_count: 11, city_id: 191, installation_date: "2013-06-08")
      Station.create(Station id: 66, name: "South Van Ness at Market", dock_count: 19, city_id: 195, installation_date: "2013-06-08")
      Station.create(Station id: 27, name: "Mountain View City Hall", dock_count: 15, city_id: 193, installation_date: "2013-06-08")
      Station.create(Station id: 10, name: "San Jose City Hall", dock_count: 15, city_id: 191, installation_date: "2013-06-08")
      Station.create(Station id: 5, name: "Adobe on Almaden", dock_count: 19, city_id: 191, installation_date: "2013-05-08")
      Station.create(Station id: 57, name: "5th at Howard", dock_count: 15, city_id: 195, installation_date: "2013-05-08")
    end

    describe ".average_duration" do
      it "returns average duration of trips" do
        expect(Trip.average_duration).to eq(165)
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
        expect(Trip.start_station_with_most_rides).to eq("South Van Ness at Market")
      end
    end

    describe ".end_station_with_most_rides" do
      it "returns station with most ending trips" do
        expect(Trip.end_station_with_most_rides).to eq("South Van Ness at Market")
      end
    end

    describe ".month_summary" do
      it "returns the number total rides of each month" do
        expect(Trip.month_summary.first).to eq([[2013, 08], 5])
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
        expect(Trip.subscription_info.first).to eq({1 => 4, 2 => 1})
      end
    end

    describe "subscription_percentage" do
      it "returns percentage of subscribers and customers" do
        expect(Trip.subscription_percentage(4)).to eq(1, 83.33)
      end
    end

    describe ".date_with_highest_trip_count" do
      it "returns date with highest trip count" do
        expect(Trip.date_with_highest_trip_count).to eq([8, 29, 2013], 5)
      end
    end

    describe ".dates_with_lowest_trip_count" do
      it "returns date with lowest trip count" do
        expect(Trip.date_with_lowest_trip_count).to eq([][9, 1, 2014], 1])
      end
    end

    describe ".number_of_starting_rides_at_station" do
      it "returns number of rides starting at a station" do
        expect(Trip.number_of_starting_rides_at_station(66)).to eq(3)
      end
    end

    describe ".number_of_ending_rides_at_station" do
      it "returns number of rides ending at a station" do
        expect(Trip.number_of_ending_rides_at_station(5)).to eq(1)
      end
    end

    describe ".most_frequent_destination" do
      it "returns most frequent destination from this station" do
        expect(Trip.most_frequent_destination(66)).to eq("South Van Ness at Market")
      end
    end

    describe ".most_frequent_origination" do
      it "returns most frequent origination to this station" do
        expect(Trip.most_frequent_origination(10)).to eq("San Jose City Hall")
      end
    end

    describe ".date_with_highest_trip_from_this_station" do
      it "returns date with highest trip from this station" do
        expect(Trip.date_with_highest_trip_from_this_station(4)).to eq("8/29/2013")
      end
    end

    describe ".most_frequent_zip_code_users_starting" do
      it "returns zip code with most frequent starting rides" do
        expect(Trip.most_frequent_zip_code_users_starting(66)).to eq(94103)
      end
    end

    describe ".most_frequent_bike_starting" do
      it "returns bike id with most frequent starting ride" do
        expect(Trip.most_frequent_bike_starting(66)).to eq(318)
      end
    end
end
