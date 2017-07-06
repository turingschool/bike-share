RSpec.describe Subscription do
  describe "Relationships" do
    it ".trips returns all related trips" do
      trip1 = Trip.create(duration: 113, start_station_id: 66, end_station_id: 66, bike_id: 318, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 17:01:00", end_date: "2013-08-29 17:03:00", weather_id: 1)
      trip2 = Trip.create(duration: 71, start_station_id: 27, end_station_id: 27, bike_id: 48, zip_code: 97214, subscription_id: 1, start_date: "2013-08-29 10:16:00", end_date: "2013-08-29 10:17:00", weather_id: 1)
      trip3 = Trip.create(duration: 70, start_station_id: 10, end_station_id: 10, bike_id: 48, zip_code: 95138, subscription_id: 1, start_date: "2013-08-29 14:42:00", end_date: "2013-08-29 14:43:00", weather_id: 1)
      trip4 = Trip.create(duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 48, zip_code: 94103, subscription_id: 1, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:14:00", weather_id: 1)
      trip5 = Trip.create(duration: 569, start_station_id: 66, end_station_id: 57, bike_id: 318, zip_code: 32, subscription_id: 2, start_date: "2014-09-01 00:05:00", end_date: "2014-09-01 00:15:00", weather_id: 1)
      subscriber = Subscription.create(subscription_type: "Subscriber")
      customer = Subscription.create(subscription_type: "Customer")

      expect(subscriber.trips).to eq([trip1, trip2, trip3, trip4])
      expect(customer.trips).to eq([trip5])
    end
  end
end
