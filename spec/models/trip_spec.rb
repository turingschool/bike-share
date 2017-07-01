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
end
