require 'spec_helper'

describe Station do
  before(:each) do
    Station.create(name: "San Jose Civic Center", dock_count: 15, city: "San Jose", installation_date: "2013-08-06")
    Station.create(name: "Timo", dock_count: 10, city: "San Jose", installation_date: "2014-04-09")
    Station.create(name: "Lee", dock_count: 5, city: "SD", installation_date: "2015-06-09")
    @station = Station.create(name: "San Jose Civic Center", dock_count: 2, city: "SF", installation_date: "2013-08-06")

    @t = Trip.create(duration: 63, 
                start_date: DateTime.strptime("8/9/2013", "%m/%d/%Y"),
                start_station_name: "San Jose Civic Center",
                start_station_id: @station.id,
                end_date: DateTime.strptime("8/9/2013", "%m/%d/%Y"),
                end_station_name: "San Jose Civic Center",
                end_station_id: @station.id,
                bike_id: 3,
                subscription_type: "Subscriber",
                zip_code: 94127
                )

  end

  describe "Validations" do
    it "is invalid without a name" do
      station = Station.new(dock_count: 2, city: "SF", installation_date: "10-20-2013")

      expect(station).to be_invalid
    end
    it "is invalid without a dock_count" do
      station = Station.new(name: "Mission", city: "SF", installation_date: "10-20-2013")

      expect(station).to be_invalid
    end
    it "is invalid without a city" do
      station = Station.new(name: "Mission", dock_count: 5, installation_date: "10-20-2013")

      expect(station).to be_invalid
    end
     it "is invalid without a installation_date" do
      station = Station.new(name: "Mission", dock_count: 5, city: "SF")

      expect(station).to be_invalid
    end
  end

  describe "Class Methods" do
    it "finds average bike docks per station" do

      expect(Station.average_bike_docks_per_station).to eq(0.8e1)
    end
    it "finds most bikes at station" do
     
      expect(Station.most_bikes_at_station).to eq(15)
    end
    it "finds station with most bikes" do

      expect(Station.stations_with_most_bikes.first.name).to eq("San Jose Civic Center")
      expect(Station.stations_with_most_bikes.first.dock_count).to eq(15)
    end
    it "finds fewest bikes at station" do

      expect(Station.fewest_bikes_at_station).to eq(2)
    end
    it "finds stations with fewest bikes" do

      expect(Station.stations_with_fewest_bikes.first.name).to eq("San Jose Civic Center")
      expect(Station.stations_with_fewest_bikes.first.dock_count).to eq(2)
    end
    it "finds station with most recent installation date" do

      expect(Station.most_recent_station_date).to eq(Date.parse("2015-06-09"))
    end
    it "finds station with oldest installation date" do

      expect(Station.oldest_station_date).to eq(Date.parse("2013-08-06"))
    end
    it "finds most recent station" do

      expect(Station.most_recent_station.first.name).to eq("Lee")
      expect(Station.most_recent_station.first.city).to eq("SD")
    end
    it "finds oldest station" do

      expect(Station.oldest_station.first.name).to eq("San Jose Civic Center")
    end

    it "finds most rides as starting place" do

      expect(Station.most_rides_as_starting_place).to eq("San Jose Civic Center")
    end
    it "most rides as ending place" do

      expect(Station.most_rides_as_ending_place).to eq("San Jose Civic Center")
    end
  end
  describe "Instance Methods" do 
    it "number of starting rides" do

      expect(@station.number_of_starting_rides).to eq(1)
    end
    it "number of ending rides" do 

      expect(@station.number_of_ending_rides).to eq(1)
    end
  end
  describe "Associations" do 
    it{ should have_many(:trips_starting_here)}
    it{ should have_many(:trips_ending_here)}    
    end
end
