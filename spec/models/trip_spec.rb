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
end
