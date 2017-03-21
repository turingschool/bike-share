require_relative "../spec_helper"

RSpec.describe Trip do

  describe "validations" do
    it "is valid with all attributes" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to be_valid
    end

    it "is invalid without duration" do

      trip = Trip.create({duration: , start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station id" do

      trip = Trip.create({duration: 63, start_station_id: , end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station id" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: , bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: , subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a zipcode_id" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: , subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_id" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: , start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "", end_date: "8/29/2013 14:14" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a end date" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, subscription_type: "Subscriber", zipcode_id: 1, subscription_id: 2, start_date: "8/29/2013 14:13", end_date: "" })

      expect(trip).to_not be_valid
    end
  end

end
