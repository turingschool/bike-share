require_relative '../spec_helper'

RSpec.describe Station do
  describe "creating a station with attributes" do
    it "requires name, dock_count, city, and installation_date attributes" do
      valid_station = Station.create(name: "stationicus",
                                     dock_count: 42,
                                     city: "Denver",
                                     date: "8/6/2013")
      expect(valid_station).to be_valid

      no_name_station = Station.create(dock_count: 42,
                                       city: "Denver",
                                       date: "8/6/2013")
      expect(no_name_station).not_to be_valid

      no_dock_count_station = Station.create(name: "stationicus",
                                             city: "Denver",
                                             date: "8/6/2013")
      expect(no_dock_count_station).not_to be_valid

      no_city_station = Station.create(name: "stationicus",
                                       dock_count: 42,
                                       date: "8/6/2013")
      expect(no_city_station).not_to be_valid

      no_date_station = Station.create(name: "stationicus",
                                       dock_count: 42,
                                       city: "Denver")
      expect(no_date_station).not_to be_valid
    end

    it "requires the proper data types for each attribute" do
      invalid_name_station = Station.create(name: 42,
                                     dock_count: 42,
                                     city: "Denver",
                                     date: "8/6/2013")
      expect(invalid_name_station).not_to be_valid

      invalid_dock_count_station = Station.create(name: "stationicus",
                                                  dock_count: "42",
                                                  city: "Denver",
                                                  date: "8/6/2013")
      expect(invalid_dock_count_station).not_to be_valid

      invalid_city_station = Station.create(name: "stationicus",
                                            dock_count: 42,
                                            city: 42,
                                            date: "8/6/2013"
      )
      expect(invalid_city_station).not_to be_valid

      invalid_date_station = Station.crete(name: "stationicus",
                                           dock_count: 42,
                                           city: "Denver",
                                           date: 42)

      expect(invalid_date_station).not_to be_valid
    end
  end
end
