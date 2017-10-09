require_relative '../spec_helper'

RSpec.describe Trip do

  describe "Validation" do
    it "is invalid without a duration" do
      trip = Trip.new(
        start_date: DateTime.new(2013,8,29,14,13),
         start_station_name: "South Van Ness at Market",
         start_station_id: 66,
         end_date: DateTime.new(2013,8,29,14,14),
         end_station_name: "South Van Ness at Market",
         end_station_id: 66,
         bike_id: 520,
         subscription_type: "Subscriber",
         zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do
      trip = Trip.new(
        duration: 63,
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_station_name" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_date" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a end_station_name" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_id: 66,
        bike_id: 520,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike_id" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        subscription_type: "Subscriber",
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end

    it "is invalid without a subscription_type" do
      trip = Trip.new(
        duration: 63,
        start_date: DateTime.new(2013,8,29,14,13),
        start_station_name: "South Van Ness at Market",
        start_station_id: 66,
        end_date: DateTime.new(2013,8,29,14,14),
        end_station_name: "South Van Ness at Market",
        end_station_id: 66,
        bike_id: 520,
        zip_code: 94127
       )

      expect(trip).to_not be_valid
    end
  end
end
