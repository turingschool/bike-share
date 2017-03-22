require_relative "../spec_helper"

RSpec.describe Trip do

  describe "validations" do
    it "is valid with all attributes" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      expect(trip).to be_valid
    end

    it "is invalid without duration" do

      trip = Trip.create({start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a start station id" do

      trip = Trip.create({duration: 63, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      expect(trip).to_not be_valid
    end

    it "is invalid without an end station id" do

      trip = Trip.create({duration: 63, start_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a bike id" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a start_date" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, end_date: "2013-08-29 14:13:00" })

      expect(trip).to_not be_valid
    end

    it "is invalid without a end date" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00"})

      expect(trip).to_not be_valid
    end
  end

  describe "average duration of ride" do

    it "returns the average duration of a ride" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 83, start_station_id: 10, end_station_id: 11, bike_id: 525, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      result = Trip.average_duration_of_ride
      expect(result).to eq(73)
    end
  end

  describe "longest ride" do

    it "returns the longest ride" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 133, start_station_id: 64, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      result = Trip.longest_ride
      expect(result).to eq(133)
    end
  end

  describe "shortest ride" do

    it "returns the shortest ride" do

      trip = Trip.create({duration: 63, start_station_id: 66, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 133, start_station_id: 64, end_station_id: 66, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      result = Trip.shortest_ride
      expect(result).to eq(63)
    end
  end

  describe "station with the most rides as a starting place" do

    it "returns station with the most rides as a starting place" do
      station_1 = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station_2 = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})

      trip = Trip.create({duration: 63,           start_station_id: 1, end_station_id: 1, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 63, start_station_id: 2, end_station_id: 1, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 133, start_station_id: 2, end_station_id: 1, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      result = Station.station_with_the_most_rides_as_a_starting_place
      expect(result).to eq(station_2)
    end
  end

  describe "station with the most rides as an ending place" do

    xit "returns station with the most rides as an ending place" do

      station = Station.create({name: "PooTown",
                                dock_count: 15,
                                city_id: 1,
                                installation_date: "8/12/13"})
      station = Station.create({name: "Burlingame",
                                dock_count: 11,
                                city_id: 3,
                                installation_date: "8/12/13"})

      trip = Trip.create({duration: 63,           start_station_id: 1, end_station_id: 1, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 63, start_station_id: 2, end_station_id: 1, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      trip = Trip.create({duration: 133, start_station_id: 2, end_station_id: 1, bike_id: 520, zipcode_id: 1, subscription_id: 2, start_date: "2013-08-29 14:13:00", end_date: "2013-08-29 14:13:00" })

      result = Station.station_with_the_most_rides_as_a_ending_place
      expect(result).to eq(station_1)
    end
  end


end
