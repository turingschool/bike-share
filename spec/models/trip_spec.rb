require_relative '../spec_helper'

RSpec.describe Trip do
  describe "attributes" do
    it "returns value in duration column" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)

      expect(trip.duration).to eq(400)
      expect(trip.start_station_id).to eq(1)
      expect(trip.end_station_id).to eq(2)
      expect(trip.start_date.day).to eq(12)
      expect(trip.end_date.day).to eq(12)
      expect(trip.bike_id).to eq(122)
      expect(trip.zip_code).to eq(80218)
    end
  end

    describe "validations" do
      it "is invalid without a duration" do
        subscription = SubscriptionType.create(name: "Customer")
        ride_date = RideDate.create(day: 12, month: 8, year: 2012)
        trip = subscription.trips.create(start_station_id: 1,
                                  end_station_id: 2,
                                  start_date: ride_date,
                                  end_date: ride_date,
                                  bike_id: 122,
                                  zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                end_station_id: 2,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                start_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_id" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                start_date: ride_date,
                                end_date: ride_date,
                                zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type_id" do
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = Trip.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(trip).to_not be_valid
    end

    it "is valid without a zip_code" do
      subscription = SubscriptionType.create(name: "Customer")
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 2,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122)
      expect(trip).to be_valid
    end
  end

  describe "access to stations" do
    it "returns value in name column of station" do
      ride_date = RideDate.create(day: 12, month: 8, year: 2012)
      city = City.create(name: "San Jose")
      city.stations.create(name: "MLK Station", dock_count: 19, city_id: 1, installation_date: "2013-5-11")
      city.stations.create(name: "Cesar Chavez Station", dock_count: 5, city_id: 1, installation_date: "2013-5-19")
      start_station = StartStation.create(station_id: 2)
      end_station = EndStation.create(station_id: 1)
      subscription = SubscriptionType.create(name: "Customer")
      trip = subscription.trips.create(duration: 400,
                                start_station_id: 1,
                                end_station_id: 1,
                                start_date: ride_date,
                                end_date: ride_date,
                                bike_id: 122,
                                zip_code: 80218)
      expect(trip.start_station.station.name).to eq("Cesar Chavez Station")
      expect(trip.end_station.station.name).to eq("MLK Station")
    end
  end
end
