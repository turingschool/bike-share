require 'spec_helper'

RSpec.describe Trip do
  describe "validations" do
    it "is invalid without a duration" do
      trip = Trip.create(start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a start date" do
      trip = Trip.create(duration: 40, start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a start station" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without an end date" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_station_name: "Golden Gate at Polk", bike_id: 527, subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without an end_station_name" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", bike_id: 527, subscription: "Subscriber", zip_code: 94109)


      expect(trip).to be_invalid
    end

    it "is invalid without a bike id" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", subscription: "Subscriber", zip_code: 94109)

      expect(trip).to be_invalid
    end

    it "is invalid without a subscription type" do
      trip = Trip.create(duration: 40, start_date: "8/29/2013 18:54", start_station_name: "Golden Gate at Polk", end_date: "8/29/2013 18:56", end_station_name: "Golden Gate at Polk", bike_id: 527, zip_code: 94109)

      expect(trip).to be_invalid
    end
  end

  describe "Class Methods" do
    xit "can find average duration of rides" do

    end
  end
end
