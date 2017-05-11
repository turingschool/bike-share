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
                      name: "something",
                      dock_count: 1, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -121.9, 
                      latitude: 30.7)
      station_2 = Station.create(
                      name: "else",
                      dock_count: 2, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -120.9, 
                      latitude: 30.9)                      
      trip_1 = Trip.create(
                      duration: 239,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Customer",
                      zipcode_id: 1
    )
      trip_2 = Trip.create(
                      duration: 241,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 2,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 6,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
      trip_3 = Trip.create(
                      duration: 243,
                      start_date: DateTime.strptime("09/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 2,
                      end_date: DateTime.strptime("09/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 2,
                      bike_id: 6,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
    }
    it "can calculate the average number of duration for all rides" do
      expect(Trip.average_duration).to eq(241)
    end

    it "can calculate the longest ride" do
      expect(Trip.longest_ride).to eq(243)
    end

    it "can calculate the shortest ride" do
      expect(Trip.shortest_ride).to eq(239)
    end

    it "can calculate the station with the most rides as a starting place" do
      expect(Trip.starting_station_most_rides).to eq("else")
    end

    it "can calculate the station with the most rides as a ending place" do
      expect(Trip.ending_station_most_rides).to eq("something")
    end
  
     it "can calculate month by month breakdown of number of rides for August 2013" do
      expect(Trip.monthly_breakdown_of_rides(2013, 8)).to eq(2)
    end

    it "can calculate month by month breakdown of number of rides for September 2013" do
      expect(Trip.monthly_breakdown_of_rides(2013, 9)).to eq(1)
    end

    it "can calculate most ridden bike with total number of rides for that bike" do
      expect(Trip.most_ridden_bike_id).to eq(6)
      expect(Trip.most_ridden_bike_rides).to eq(2)
    end

    it "can calculate least ridden bike with total number of rides for that bike" do
      expect(Trip.least_ridden_bike_id).to eq(5)
      expect(Trip.least_ridden_bike_rides).to eq(1)
    end

    it "can calculate user subscription type breakout with both count and percentage" do
      expect(Trip.customer_subscription_count).to eq(1)
      expect(Trip.subscriber_subscription_count).to eq(2)
      expect(Trip.customer_subscription_percentage).to eq(33.33)
      expect(Trip.subscriber_subscription_percentage).to eq(66.67)
    end

    it "can calculate single date with the highest number of trips with a count of those trips" do
      expect(Trip.highest_number_of_trips_date).to eq("08/30/2013")
      expect(Trip.highest_number_of_trips_total).to eq(2)
    end

    it "can calculate single date with the least number of trips with a count of those trips" do
      expect(Trip.lowest_number_of_trips_date).to eq("09/30/2013")
      expect(Trip.lowest_number_of_trips_total).to eq(1)
    end    
  end
  
  describe "trip can calculate dashboard information on station show page" do
    before {
      zipcode = Zipcode.create(zipcode: 94127)
      station_1 = Station.create(
                      name: "something",
                      dock_count: 1, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -121.9, 
                      latitude: 30.7)
      station_2 = Station.create(
                      name: "else",
                      dock_count: 2, 
                      city_id: 1, 
                      installation_date: Date.strptime("08/30/2013",'%m/%d/%Y'), 
                      longitude: -120.9, 
                      latitude: 30.9)                      
      trip_1 = Trip.create(
                      duration: 239,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 1,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 5,
                      subscription_type: "Customer",
                      zipcode_id: 1
    )
      trip_2 = Trip.create(
                      duration: 241,
                      start_date: DateTime.strptime("08/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 2,
                      end_date: DateTime.strptime("08/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 1,
                      bike_id: 6,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
      trip_3 = Trip.create(
                      duration: 243,
                      start_date: DateTime.strptime("09/30/2013 11:11", "%m/%d/%Y %H:%M"),
                      start_station_id: 2,
                      end_date: DateTime.strptime("09/30/2013 11:15", "%m/%d/%Y %H:%M"),
                      end_station_id: 2,
                      bike_id: 6,
                      subscription_type: "Subscriber",
                      zipcode_id: 1
    )
  }
    it "can calculate number of rides started at this station" do
      expect(Trip.rides_started_at_station(2)).to eq(2)
      expect(Trip.rides_started_at_station(1)).to eq(1)
    end

    it "can calculate number of rides ended at this station" do
      expect(Trip.rides_ended_at_station(1)).to eq(2)
      expect(Trip.rides_ended_at_station(2)).to eq(1)
    end

    it "can calculate most frequent destination station for rides from this station" do
      expect(Trip.frequent_destination_station(1)).to eq("something")
    end

    it "can calculate most frequent origination station for rides to this station" do
      expect(Trip.frequent_origination_station(2)).to eq("else")
    end

    it "can calculate date with the highest number of trips started at this station" do
      expect(Trip.busiest_origination_date(1)).to eq("08/30/2013")
    end

    it "can calculate most frequent zip code for users starting trips at this station" do
      expect(Trip.frequent_starting_user_zipcode(1)).to eq("94127")
    end

    it "can calculate Bike ID most frequently starting a trip at this station" do
      expect(Trip.frequent_origin_bike_id(1)).to eq(5)
    end

  end
end