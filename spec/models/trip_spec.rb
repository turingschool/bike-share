require 'spec_helper'
require 'pry'


RSpec.describe Trip do
  describe 'Class Methods' do
    describe '.duration' do
      it 'returns the duration of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.duration).to eq(5)
      end
    end

    describe '.start_date' do
      it 'returns the start date of the trip' do
        date = DateTime.new(5-14-2010)
        trip = Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)

        expect(trip.start_date).to eq("-2019-01-01 00:00:00 UTC")
      end
    end

    describe '.start_station_name' do
      it 'returns the name of the start station' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip.start_station_name).to eq("Train")
      end
    end

    describe '.end_date' do
      it 'returns the end date of the trip' do
        date = DateTime.new(5-14-2010)
        trip = Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)

        expect(trip.end_date).to eq("-2019-01-01 00:00:00 UTC")
      end
    end

    describe '.end_station_name' do
      it 'returns the name of the end station' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.end_station_name).to eq("California")
      end
    end

    describe '.bike_id' do
      it 'returns the bike id of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip.bike_id).to eq("540")
      end
    end

    describe '.subscription_type' do
      it 'returns the subscription type of the user of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.subscription_type).to eq("Subscriber")
      end
    end

    describe '.zip_code' do
      it 'returns the zip code of the trip' do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

       expect(trip.zip_code).to eq("80219")
      end
    end

    describe '.average_trip_length' do
      it 'returns the average length of the trip' do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        Station.create(name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

       expect(Trip.average_trip_length).to eq(5)
      end
    end

    describe '.longest_ride' do
      it 'returns the average length of the trip' do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        Station.create(name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

       expect(Trip.longest_ride).to eq(5)
      end
    end

    describe '.shortest_ride' do
      it 'returns the station with shortest ride' do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        Station.create(name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

       expect(Trip.shortest_ride).to eq(5)
      end
    end

    describe '.station_with_most_rides_at_start' do
      it 'returns the station with the most rides at start' do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        Station.create(id:3,name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
        Station.create(name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

       expect(Trip.station_with_most_rides_at_start).to eq("That station")
      end
    end

    describe '.station_with_least_rides_at_start' do
      it 'returns the station with the least rides at the start' do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")


        Station.create!(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
        Station.create!(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

       expect(Trip.station_with_most_rides_at_start).to eq("Another station")
      end
    end
    describe '.station_with_most_rides_at_end' do
      it 'returns the station with most rides at the end' do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
        Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
        Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

       expect(Trip.station_with_most_rides_at_start).to eq("Another station")
      end
    end

      describe '.years' do
        it 'returns the years of the trips' do
          date = DateTime.now
          # date1 = DateTime.new(5-14-2010)

          Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
          Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

          Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
          Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

         expect(Trip.years).to eq([2017.0])
        end
      end

  describe '.find_month_names' do
    it 'returns the names of the month' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

     expect(Trip.find_month_names(10)).to eq("October")
    end
  end

  describe '.trips_per_month' do
    it 'returns the trips per month' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.trips_per_month).to eq([{2017.0=>{"December"=>2}}])
    end
  end

  describe '.sum_trips_per_year' do
    it 'sum of the trips per year' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.sum_trips_per_year).to eq([[2017.0, 2]])
    end
  end

  describe '.most_ridden_bike' do
    it '.most ridden bike' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.most_ridden_bike).to eq(["540", 2])
    end
  end

  describe '.least_ridden_bike' do
    it '.least ridden bike' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.least_ridden_bike).to eq(["540", 2])
    end
  end

  describe '.percentage_of_subscriber_type' do
    it 'returns the percentage of each subscriver type' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.percentage_of_subscriber_type).to eq([100.0])
    end
  end

  describe '.subscription_type_breakout' do
    it 'returns the breakdown of the subscriber types' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.subscription_type_breakout).to eq({"Subscriber"=>2})
    end
  end

  describe '.date_with_most_trips' do
    it 'returns the date with the most trips' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.date_with_most_trips).to eq(["12-05-17", 1])
    end
  end

  describe '.date_with_least_trips' do
    it 'returns the dates with least amount trips' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

      Station.create(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create(id:2, name: "Another station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

     expect(Trip.date_with_least_trips).to eq( ["12-05-17", 1])
    end
  end

  describe '.most_frequent_destination' do
    it 'returns the most frequent desitination' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 2)

      station = Station.create!(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

      expect(Trip.most_frequent_destination(station)).to eq( "That station")
    end
  end

  describe '.most_frequent_origination' do
    it 'returns the most frequent origination' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219",end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219",end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 2)

      station = Station.create!(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      station1 = Station.create!(id:2, name: "This station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

      expect(Trip.most_frequent_origination(station)).to eq( "This station")
    end
  end

  describe '.date_with_highest_number_of_trips_started_at_this_station' do
    it 'returns the date with the highest number of trips at that station' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219",end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219",end_station_id: 2)

      station = Station.create!(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

      expect(Trip.date_with_highest_number_of_trips_started_at_this_station(station)).to eq("12/5/2017")
    end
  end

  describe '.most_frequent_zip_code_for_users_starting_trips_at_this_station' do
    it 'returns the most frequest zip code for that station' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80229", end_station_id: 2)

      station = Station.create!(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

      expect(Trip.most_frequent_zip_code_for_users_starting_trips_at_this_station(station)).to eq("80219")
    end
  end
  describe '.bike_id_most_frequently_starting_a_trip_at_this_station' do
    it 'returns the bike most frequently starting at that station' do
      date = DateTime.now
      Trip.create!(duration: "5", start_date: date, start_station_id: 3  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", end_station_id: 3)
      Trip.create!(duration: "5", start_date: date, start_station_id: 2  , start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "40", subscription_type: "Subscriber", zip_code: "80229", end_station_id: 2)

      station = Station.create!(id:3, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

      expect(Trip.bike_id_most_frequently_starting_a_trip_at_this_station(station)).to eq("540")
    end
  end



    describe "validations" do
      it "is invalid without a duration" do
        trip = Trip.create(start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a start date" do
        trip = Trip.create(duration: "5", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a start station name" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without an end date" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without an end station name" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a bike id" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", subscription_type: "Subscriber", zip_code: "80219")

        expect(trip).to be_invalid
      end

      it "is invalid without a subscription type" do
        trip = Trip.create(duration: "5", start_date: "05-14-2010", start_station_name: "Train", end_date: "50-54-2010", end_station_name: "California", bike_id: "540", zip_code: "80219")

        expect(trip).to be_invalid
      end
    end
  end
end
