require 'spec_helper'

RSpec.describe Station do
  describe "validations" do
    it "is invalid without a name" do
      station = Station.create(dock_count: 40, city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without a dock count" do
      station = Station.new(name: "Japantown", city: "San Francisco", installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without a city" do
      station = Station.new(name: "Japantown", dock_count: 40, installation_date: 8/6/2013)

      expect(station).to be_invalid
    end

    it "is invalid without an installation_date" do
      station = Station.new(name: "Japantown", dock_count: 40, city: "San Francisco")

      expect(station).to be_invalid
    end

    it "is valid with all the requisite information" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.all.count).to eql(3)
    end
  end

  describe "class methods" do
    it "can find average bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.average_bikes_per_station).to eql(18)
    end

    it "can find most bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.most_bikes).to eql(27)
    end

    it "can find station with most bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.with_most_bikes.first.name).to eql("San Jose Diridon Caltrain Station")
    end

    it "can find fewest bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.fewest_bikes).to eql(13)
    end

    it "can find station with fewest bikes" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.with_fewest_bikes.first.name).to eql("MLK Library")
    end

    it "can find newest install date" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect((Station.newest_install_date).strftime("%d/%m/%Y")).to eql("12/08/2013")
    end

    it "can find newest station" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.newest_station.first.name).to eql("Clay at Battery")
    end

    it "can find oldest install date" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect((Station.oldest_install_date).strftime("%d/%m/%Y")).to eql("01/08/2013")
    end

    it "can find oldest station" do
      Station.create(name: "San Jose Diridon Caltrain Station", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "MLK Library", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")
      Station.create(name: "Clay at Battery", dock_count: 15, city: "San Francisco", installation_date: "12/8/2013")

      expect(Station.oldest_station.first.name).to eql("San Jose Diridon Caltrain Station")
    end

    it "can find the most frequent destination by station" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "Mountain View City Hall", end_station_id: 3, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all.first

      expect(station.most_frequent_destination).to eql("San Jose City Hall")
     end

    it "can find the most frequent origination by station" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all[1]

      expect(station.most_frequent_origination_station).to eql("South Van Ness at Market")
   end

    it "can find the number of trips started by station" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 2, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all[0]

      expect(station.number_of_trips_started_at_station).to eql(2)
   end

    it "can find the number of arriving trips by station" do
      Trip.create(duration: 63, start_date: "29/8/2013", start_station_name: "San Jose City Hall", start_station_id: 2, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all[1]

      expect(station.number_of_trips_ending_at_station).to eql(3)
   end

    it "can find the date with the highest trips by station" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 94127)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "MLK Library", end_station_id: 3, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all[0]

      expect((station.date_with_highest_trips_by_station).strftime("%m/%d/%Y")).to eql("08/29/2013")
    end

    it "can find the most frequent user zipcode" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 97214)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "MLK Library", end_station_id: 3, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all[0]

      expect(station.most_frequent_user_zipcodes).to eql(97214)
    end

    it "can find the most frequent bike used" do
      Trip.create(duration: 63, start_date: "30/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "South Van Ness at Market", end_station_id: 1, bike_id: 520, subscription: "Subscriber", zip_code: 97214)
      Trip.create(duration: 70, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "San Jose City Hall", end_station_id: 2, bike_id: 520, subscription: "Subscriber", zip_code: 95138)
      Trip.create(duration: 71, start_date: "29/8/2013", start_station_name: "South Van Ness at Market", start_station_id: 1, end_date: "2013-08-29", end_station_name: "MLK Library", end_station_id: 3, bike_id: 48, subscription: "Subscriber", zip_code: 97214)

      Station.create(name: "South Van Ness at Market", dock_count: 27, city: "San Jose", installation_date: "1/8/2013")
      Station.create(name: "San Jose City Hall", dock_count: 13, city: "San Jose", installation_date: "5/8/2013")

      station = Station.all[0]

      expect(station.most_frequent_bike_used).to eql(520)
    end
  end
end
