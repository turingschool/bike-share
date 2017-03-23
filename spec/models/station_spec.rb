require_relative '../spec_helper'

RSpec.describe Station do
  attr_reader :station_1,
              :station_2,
              :station_3

  before :each do
    City.create(name:"Chicago")
    City.create(name:"Denver")
    @station_1 = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160101", city_id: 1)
    @station_2 = Station.create(name: "Whatever", dock_count: "6", installation_date: "20160203", city_id: 2)
    @station_3 = Station.create(name: "New", dock_count: "10", installation_date: "20160303", city_id: 2)
    Trip.create(duration: 39,
                start_date: format_date("12/15/2013 14:54"),
                start_station_id: 1,
                end_date: format_date("12/15/2013 15:56"),
                bike_id: 4,
                end_station_id: 2,
                subscription_type_id: 1,
                zip_code: 12345
                )

    @three = Trip.create(duration: 39,
                start_date: format_date("12/15/2013 14:54"),
                start_station_id: 1,
                end_date: format_date("12/15/2013 15:56"),
                bike_id: 4,
                end_station_id: 3,
                subscription_type_id: 1,
                zip_code: 12345
                )

    Trip.create(duration: 39,
                start_date: format_date("12/15/2013 14:44"),
                start_station_id: 1,
                end_date: format_date("12/15/2013 15:56"),
                bike_id: 6,
                end_station_id: 2,
                subscription_type_id: 1,
                zip_code: 12345
                )
     Trip.create(duration: 45,
                 start_date: format_date("11/12/2013 14:54"),
                 start_station_id: 1,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 1,
                 subscription_type_id: 1,
                 zip_code: 11111
                 )
     Trip.create(duration: 45,
                 start_date: format_date("11/13/2013 14:54"),
                 start_station_id: 1,
                 end_date: format_date("11/15/2013 15:56"),
                 bike_id: 6,
                 end_station_id: 1,
                 subscription_type_id: 1,
                 zip_code: 11111
                 )
  end

  describe "validations" do
    it "should be valid with all attributes" do
      expect(Station.first).to be_valid
    end

    it "should be invalid without name" do
      station = Station.create(dock_count: "10", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without dock_count" do
      station = Station.create(name: "Navy Pier", installation_date: "20160203", city_id: 1)

      expect(station).to_not be_valid
    end

    it "should be invalid without city" do
      station = Station.create(name: "Navy Pier", dock_count: "10", installation_date: "20160203")

      expect(station).to_not be_valid
    end

    it "should be invalid without installation_date" do
      station = Station.create(name: "Navy Pier", dock_count: "10")

      expect(station).to_not be_valid
    end
  end

  describe "calculation methods" do
    it "#average_bikes should return 8" do
      expect(Station.average_bikes).to eq(9)
      expect(Station.average_bikes).not_to be_nil
    end

    it "#most_bikes should return 10" do
      expect(Station.most_bikes).to eq(10)
      expect(Station.most_bikes).not_to be_nil
    end

    it "#stations_by_most_docks should return station names" do
      expect(Station.stations_by_most_docks).to be_kind_of(String)
      expect(Station.stations_by_most_docks).to eq("Navy Pier, New")
    end

    it "#fewest_bikes should return 6" do
      expect(Station.fewest_bikes).to eq(6)
      expect(Station.fewest_bikes).not_to be_nil
    end

    it "#stations_by_least_docks should return station names" do
      expect(Station.stations_by_least_docks).to be_kind_of(String)
      expect(Station.stations_by_least_docks).to eq("Whatever")
    end

    it "#stations_by_install_date" do
      expect(Station.stations_by_install_date).to be_kind_of(Array)
      expect(Station.stations_by_install_date.first.name).to eq("New")
    end

    it "#newest_station should return a station name" do
      expect(Station.newest_station).to be_kind_of(Station)
      expect(Station.newest_station.name).to eq("New")
    end

    it "#oldest_station should return a station object" do
      expect(Station.oldest_station).to be_kind_of(Station)
      expect(Station.oldest_station.name).to eq("Navy Pier")
    end

    it "#get_highest_uniq_ids should return [2, 1]" do
      expect(station_1.get_highest_uniq_ids).to eq([2,1])
    end

    it "#most_frequent_destinations should return most frequent destination for rides from this station" do
      expect(station_1.find_highest_station_objects.first).to eq(station_2)
      expect(station_1.find_highest_station_objects.last).to eq(station_1)
    end

    it "#get_lowest_uniq_ids should return 3" do
      expect(station_1.get_lowest_uniq_ids).to eq([3])
    end

    it "#find_lowest_station_objects should return station_3" do
      expect(station_1.find_lowest_station_objects.first).to eq(station_3)
    end

    it "#busiest_day" do
      expect(station_1.busiest_day.first).to eq(("2013-12-15").to_date)
    end

    it "#most_frequent_zip returns most frequent zip" do
      expect(station_1.most_frequent_zip).to eq([12345])
    end

    it "#most_used_bike returns a bike id" do
      expect(station_1.most_used_bike).to eq([6])
    end

  end
end
