RSpec.describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.new(start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date_id" do
      trip = Trip.new(duration: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end_date_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end_station_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, subscription_type: "customer", zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, zipcode_id: 7)

      expect(trip).to_not be_valid
    end

    it "is invalid without a zipcode_id" do
      trip = Trip.new(duration: 1, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "customer")

      expect(trip).to_not be_valid
    end
  end

  describe "Class methods" do
    describe ".rides_at_start_station" do
      it "returns the number of trips started at that station" do
        trip_1 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
        trip_2 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
        trip_3 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
        trip_4 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 5, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

        result = Trip.rides_at_start_station(3)

        expect(result).to eq(3)
      end
    end

    describe ".rides_at_end_station" do
      it "returns the number of trips ended at that station" do
        trip_1 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
        trip_2 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
        trip_3 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
        trip_4 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)

        result = Trip.rides_at_end_station(4)

        expect(result).to eq(2)
      end
    end

    describe ".most_trip_date" do
      it "returns the date with the highest number of rides started at a particular station" do
      trip_1 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_2 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_3 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_4 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_5 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_6 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 1, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_7 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
      trip_8 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
binding.pry
      result = Trip.most_trip_date

      expect(result).to eq(trip_2.start_station)
      expect(result).to eq(trip_2.start_date)
      end
    end
  end
end
