RSpec.describe Trip do
  describe "Validations" do
    it "is valid with all information" do
    subscription = SubscriptionType.create(subscription_type: "customer")
    station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
    trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

    expect(trip).to be_valid
  end

    it "is invalid without a duration" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_station_id: 1, bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_id" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", bike_id: 4, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, subscription_type: subscription, zip_code: 99000)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription type" do
      subscription = SubscriptionType.create(subscription_type: "customer")
      station = Station.create(name: "Station_1", dock_count: 20, city: "bike town", installation_date: "3/4/15")
      trip = Trip.create(duration: 49, start_date: "2017-08-20 19:20:22", start_station_id: 1, end_date: "2017-08-20 19:20:22", end_station_id: 1, bike_id: 4, zip_code: 99000)

      expect(trip).to_not be_valid
    end
  end
end
