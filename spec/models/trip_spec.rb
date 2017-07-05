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

  describe "Class Methods" do
    describe '.date_with_most_trips' do
      it "returns single date with highest number of trips and count of those trips" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))


        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.date_with_most_trips

        expect(result.class).to eq(Array)
        expect(result[0]).to eq(date_2)
        expect(result[1]).to eq(3)
      end
    end

    describe ".date_with_least_trips" do
      it "returns single date with lowest number of trips and count of those trips" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))


        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.date_with_least_trips

        expect(result.class).to eq(Array)
        expect(result[0]).to eq(date)
        expect(result[1]).to eq(2)
      end
    end

    describe ".bike_with_most_rides" do
      it "returns a bike id and number of trips for that bike" do
        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 1, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 2, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 3, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.bike_with_most_rides

        expect(result[0]).to eq(6)
        expect(result[1]).to eq(5)
      end
    end
  end
end
