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

#     describe ".most_trip_date" do
#       it "returns the date with the highest number of rides started at a particular station" do
#       date_1 = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
#       date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))
#       date_3 = BikeShareDate.create(date: Date.strptime('4/5/2015', '%m/%d/%Y'))
#       trip_1 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_2 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_3 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_4 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_5 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 3, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_6 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 1, end_date_id: 2, end_station_id: 4, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_7 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 3, end_date_id: 3, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#       trip_8 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 2, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
#
#       result = Trip.most_trip_date(3)
# binding.pry
#       expect(result).to eq(trip_2.start_station)
#       expect(result).to eq(trip_2.start_date)
#       end
#     end

    # describe ".start_station_with_most_rides" do
    #   it "returns the most common destination station for this station" do
    #     station_1 = Station.create(name: "A", city: "Boston", dock_count: 2, installation_date_id: 1)
    #     station_2 = Station.create(name: "B", city: "Atlanta", dock_count: 1, installation_date_id: 1)
    #     trip_1 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 1, end_date_id: 2, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_2 = Trip.create(duration: 75, start_date_id: 2, start_station_id: 1, end_date_id: 2, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_3 = Trip.create(duration: 75, start_date_id: 3, start_station_id: 1, end_date_id: 3, end_station_id: 2, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_4 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_5 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_6 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_7 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_8 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_9 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_10 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #     trip_11 = Trip.create(duration: 75, start_date_id: 1, start_station_id: 1, end_date_id: 3, end_station_id: 1, bike_id: 6, subscription_type: "customer", zipcode_id: 7)
    #
    #     result = Trip.start_station_with_most_rides(1)
    #
    #     expect(result.name).to eq(station_1.name)
    #   end
    # end

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

        expect(result.class).to eq(Hash)
        expect(result[:date]).to eq(date_2)
        expect(result[:count]).to eq(3)
      end
    end

    describe ".date_with_least_trips" do
      it "returns single date with lowest number of trips and count of those trips" do
        date = BikeShareDate.create(date: Date.strptime('1/1/2012', '%m/%d/%Y'))
        date_2 = BikeShareDate.create(date: Date.strptime('2/5/2017', '%m/%d/%Y'))#


        Trip.create(duration: 111, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 1)
        Trip.create(duration: 222, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 333, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)
        Trip.create(duration: 444, start_date_id: 1, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "User", zipcode_id: 2)
        Trip.create(duration: 555, start_date_id: 2, start_station_id: 3, end_date_id: 4, end_station_id: 5, bike_id: 6, subscription_type: "Customer", zipcode_id: 2)

        result = Trip.date_with_least_trips

        expect(result.class).to eq(Hash)
        expect(result[:date]).to eq(date)
        expect(result[:count]).to eq(2)
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

        expect(result[:bike]).to eq(6)
        expect(result[:count]).to eq(5)
      end
    end

    describe ".bike_with_least_rides" do
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

        result = Trip.bike_with_least_rides

        expect(result[:bike]).to eq(3)
        expect(result[:count]).to eq(1)
      end
    end
  end
end
