RSpec.describe Trip do
  describe "Validations" do
    it "is invalid without a duration" do
      trip = Trip.new(start_date: 8/29/2013, start_station_id: 66, end_date: 8/29/2013, end_station_id: 66, bike_id: 520, subscription_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start date" do
      trip = Trip.new(duration: 63, start_station_id: 66, end_date: 8/29/2013, end_station_id: 66, bike_id: 520, subscription_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end date" do
      trip = Trip.new(duration: 63, start_date: 8/29/2013, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station id" do
      trip = Trip.new(duration: 63, start_date: 8/29/2013, end_date: 8/29/2013, end_station_id: 66, bike_id: 520, subscription_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station id" do
      trip = Trip.new(duration: 63, start_date: 8/29/2013, start_station_id: 66, end_date: 8/29/2013, bike_id: 520, subscription_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do
      trip = Trip.new(duration: 63, start_date: 8/29/2013, start_station_id: 66, end_date: 8/29/2013, end_station_id: 66, subscription_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type id" do
      trip = Trip.new(duration: 63, start_date: 8/29/2013, start_station_id: 66, end_date: 8/29/2013, end_station_id: 66, bike_id: 520)

      expect(trip).to_not be_valid
    end
  end
end
