RSpec.describe Trip do
  describe "Validations" do
    it "is valid with all information" do
    trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

    expect(trip).to be_valid
  end

    it "is invalid without a duration" do
      trip = Trip.create(start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      trip = Trip.create(duration: 49, start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_name" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_name" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_id: 94, bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_id" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", bike_id: 4, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, subscription_type: "Customer", zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type" do
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22",  start_station_name: "Banana Town", start_station_id: 84, end_date: "2017-08-20 19:20:22", end_station_name: "Pants Town", end_station_id: 94, bike_id: 4, zip_code: 99000)

      expect(trip).to_not be_valid
    end
  end
end
