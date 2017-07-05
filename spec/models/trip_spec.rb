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
      Trip.create(duration: 63, start_date: '8/29/13 2:13', start_station_id: 66, end_date: '8/29/13 14:14', end_station_id: 66, bike_id: 520, subscription_type: 'Subscriber', zip_code: 94127)
      Trip.create(duration: 103, start_date: '8/29/13 18:54', start_station_id: 59, end_date: '8/29/13 18:56', end_station_id: 59, bike_id: 527, subscription_type: 'Subscriber', zip_code: 94109)
      Trip.create(duration: 1508, start_date: '9/1/13 0:11', start_station_id: 75, end_date: '9/1/13 0:36', end_station_id: 56, bike_id: 506, subscription_type: 'Customer', zip_code: 94127)
      Trip.create(duration: 1541, start_date: '9/6/13 14:51', start_station_id: 75, end_date: '9/6/13 15:17', end_station_id: 54, bike_id: 397, subscription_type: 'Customer', zip_code: 94133)
    end

    describe ".average_duration" do
      it "returns average duration of trips" do
        expect(Trip.average_duration).to eq(803.75)
      end
    end

    describe ".longest_ride" do
      it "returns longest duration" do
        expect(Trip.longest_ride).to eq(1541)
      end
    end

    describe ".shortest_ride" do
      it "returns shortest duration" do
        expect(Trip.shortest_ride).to eq(63)
      end
    end

    describe ".start_station_with_most_rides" do
      it "returns station with most starting trips" do
        expect(Trip.start_station_with_most_rides).to eq('Mechanics Plaza (Market at Battery)')
      end
    end

    describe ".end_station_with_most_rides" do
      it "returns station with most ending trips" do
        expect(Trip.end_station_with_most_rides).to eq("Golden Gate at Polk")
      end
    end

end
