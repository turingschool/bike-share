require_relative '../spec_helper'

RSpec.describe Trip do

  before :each do
    SubscriptionType.create(flavor: "Subscriber")
    City.create(name: "Denver")
    Station.create(id: 7, name: "East station", installation_date: 20150331, dock_count: 45, city_id: 1)
    Trip.create(duration: 39,
                start_date: format_date("12/15/2013 14:54"),
                start_station_id: 4,
                end_date: format_date("12/15/2013 15:56"),
                bike_id: 6,
                end_station_id: 7,
                subscription_type_id: 1
                )
     Trip.create(duration: 45,
                 start_date: format_date("11/15/2013 14:54"),
                 start_station_id: 7,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 7,
                 subscription_type_id: 1
                 )
     Trip.create(duration: 45,
                 start_date: format_date("11/15/2013 14:54"),
                 start_station_id: 7,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 7,
                 subscription_type_id: 1
                 )
  end

  describe "validations" do
    it "should be valid with all attributes except zip_code" do
       trip = Trip.create(duration: 39,
                   start_date: format_date("12/15/2013 14:54"),
                   start_station_id: 4,
                   end_date: format_date("12/15/2013 15:56"),
                   bike_id: 6,
                   end_station_id: 32,
                   subscription_type_id: 1
                   )
      expect(trip).to be_valid
    end

    it "should be invalid without duration" do
       trip = Trip.create(start_date: format_date("12/15/2013 14:54"),
                   start_station_id: 4,
                   end_date: format_date("12/15/2013 15:56"),
                   bike_id: 6,
                   end_station_id: 32,
                   subscription_type_id: 1
                   )
      expect(trip).to_not be_valid
    end

    it "should be invalid without start_date" do
       trip = Trip.create(duration: 39,
                   start_station_id: 4,
                   end_date: format_date("12/15/2013 15:56"),
                   bike_id: 6,
                   end_station_id: 32,
                   subscription_type_id: 1
                   )
      expect(trip).to_not be_valid
    end

    it "should be invalid without end_date" do
       trip = Trip.create(duration: 39,
                   start_station_id: 4,
                   start_date: format_date("12/15/2013 14:54"),
                   bike_id: 6,
                   end_station_id: 32,
                   subscription_type_id: 1
                   )
      expect(trip).to_not be_valid
    end

    it "should be invalid without bike_id" do
       trip = Trip.create(duration: 39,
                   start_date: format_date("12/15/2013 14:54"),
                   start_station_id: 4,
                   end_date: format_date("12/15/2013 15:56"),
                   end_station_id: 32,
                   subscription_type_id: 1
                   )
      expect(trip).to_not be_valid
    end

    it "should be invalid without subscription_type" do
       trip = Trip.create(duration: 39,
                   start_date: format_date("12/15/2013 14:54"),
                   start_station_id: 4,
                   end_date: format_date("12/15/2013 15:56"),
                   bike_id: 6,
                   end_station_id: 32,
                   )
      expect(trip).to_not be_valid
    end
  end

  describe "calculation methods" do
    it "#average_trip_duration returns 43" do
      expect(Trip.average_trip_duration).to eq(43)
    end

    it "#longest_ride returns 45" do
      expect(Trip.longest_ride).to eq(45)
    end

    it "#shortest_ride returns 39" do
      expect(Trip.shortest_ride).to eq(39)
    end

    it "#most_start_station returns a station name" do
      expect(Trip.most_start_station).to eq(["East station"])
    end

    it "#most_start_station returns an array of station names for a tie" do
      Station.create(id: 4, name: "West station", installation_date: 20150330, dock_count: 42, city_id: 1)

      Trip.create(duration: 30,
                start_date: format_date("12/16/2013 14:54"),
                start_station_id: 4,
                end_date: format_date("12/16/2013 15:56"),
                bike_id: 5,
                end_station_id: 32,
                subscription_type_id: 1
                )


      expect(Trip.most_start_station).to eq(["East station", "West station"])
    end

    it "#most_end_station returns a station name" do

      expect(Trip.most_end_station).to eq(["East station"])
    end

    it "#monthly_totals" do

      expect(Trip.monthly_totals).to be_instance_of(Hash)
      expect(Trip.monthly_totals[2013].last).to eq(1)
      expect(Trip.monthly_totals[2013][10]).to eq(2)
    end

    it "#started_at" do
      expect(Trip.started_at(7).count).to eq(2)
    end

    it "#ended_at" do
      expect(Trip.ended_at(7).count).to eq(3)
    end

    it "#highest_number_trips_date" do

      expect(Trip.highest_number_trips_date).to be_instance_of(Array)
      expect(Trip.highest_number_trips_date.first).to eq(("2013/11/15").to_date)
    end

    it "#fewest_number_trips_date" do

      expect(Trip.fewest_number_trips_date).to be_instance_of(Array)
      expect(Trip.fewest_number_trips_date.first).to eq(("2013/12/15").to_date)
    end

  end
end
