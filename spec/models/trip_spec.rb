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

    it "is valid with a all valid info" do
      trip = Trip.new(duration: 63, start_date: 8/29/2013, start_station_id: 66, end_date: 8/29/2013, end_station_id: 66, bike_id: 520, subscription_id: 1)

      expect(trip).to be_valid
    end
  end

  describe "Class Methods" do
    before :each do
      start_date_1 = DateTime.new(2013, 8, 29, 7, 13)
      end_date_1 = DateTime.new(2013, 8, 29, 7, 14)
      start_date_2 = DateTime.new(2013, 8, 29, 7, 43)
      end_date_2 = DateTime.new(2013, 8, 29, 7, 44)
      start_date_3 = DateTime.new(2013, 8, 29, 10, 16)
      end_date_3 = DateTime.new(2013, 8, 29, 10, 17)

      Trip.create(duration: 63, start_date: start_date_1, start_station_id: 66, end_date: end_date_1, end_station_id: 66, bike_id: 520, subscription_id: 1)
      Trip.create(duration: 70, start_date: start_date_2, start_station_id: 10, end_date: end_date_2, end_station_id: 10, bike_id: 661, subscription_id: 1)
      Trip.create(duration: 71, start_date: start_date_3, start_station_id: 27, end_date: end_date_3, end_station_id: 27, bike_id: 48, subscription_id: 1)
    end

    describe ".per_page" do
      it "displays the first 30 trips" do
        trips = Trip.per_page

        expect(trips).to eq(30)
      end
    end
  end
end
