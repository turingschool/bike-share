require './spec/spec_helper'


RSpec.describe Trip do
  describe "trip can return all attributes" do
    it "has all attributes" do
      zipcode = Zipcode.create(zipcode: 94127)
      station = Station.create(
                      dock_count: 1, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -121.9, 
                      latitude: 30.7)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )

      expect(trip.id).to eq 1
      expect(trip.duration).to eq 240
      expect(trip.start_date).to eq DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M")
      expect(trip.start_station_id).to eq 1
      expect(trip.end_date).to eq DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M")
      expect(trip.end_station_id).to eq 1
      expect(trip.bike_id).to eq 5
      expect(trip.subscription_type).to eq "Subscriber"
      expect(trip.zipcode_id).to eq 1
    end
  end

  describe "trip requires all necessary fields" do
    it "is invalid without a duration" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a start date" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a start station id" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without an end date" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without end station id" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a bike id" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      subscription_type: "Subscriber",
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end

    it "is invalid without a subscription type" do
      zipcode = Zipcode.create(zipcode: 94127)
      trip = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      bike_id: 5,
                      end_station_id: 1,
                      zipcode_id: zipcode.id
      )

      expect(trip).to be_invalid
    end
  end

  describe "trip can calculate dashboard information" do
    before {
      zipcode = Zipcode.create(zipcode: 94127)
      station_1 = Station.create(
                      dock_count: 1, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -121.9, 
                      latitude: 30.7)
      station_2 = Station.create(
                      dock_count: 2, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -120.9, 
                      latitude: 30.9)                      
      trip_1 = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
      trip_2 = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 6,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
      trip_3 = Trip.create(
                      duration: 240,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 2,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 3,
                      bike_id: 6,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
    }
    it "can calculate the average number of duration for all rides" do
      expect(Trip.average_duration).to eq()
    end


  end
  

end