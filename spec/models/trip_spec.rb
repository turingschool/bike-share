require_relative '../spec_helper'

RSpec.describe Trip do
  describe "attributes" do
    it "should have duration, start_date, start_station_id, end_date, end_station_id, bike_id, subscription_type_id and zip_code_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)
      expect(trip).to respond_to(:duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type_id, :zip_code_id, :zip_code)
    end
  end

  describe "validations" do
    it "is invalid without a duration" do
      trip = Trip.new(start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      trip = Trip.new(duration: 63, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_station_id: 5, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, bike_id: 23, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, subscription_type_id: 2, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, zip_code_id: 1)

      expect(trip).to_not be_valid
    end

    it "is valid without a zip_code_id" do
      trip = Trip.new(duration: 63, start_date: 8/23/2014, start_station_id: 2, end_date: 8/23/2014, end_station_id: 5, bike_id: 23, subscription_type_id: 2)

      expect(trip).to be_valid
    end

  end
end