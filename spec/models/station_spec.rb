require_relative '../spec_helper'
require 'time'

RSpec.describe Station, :type => :model do

  date = Time.parse("08/06/2013")
  describe "creating a station with attributes" do
    it "requires name, dock_count, city, and date attributes" do
      valid_station = Station.create(name: "stationicus",
                                     dock_count: 42,
                                     city: "Denver",
                                     date: date)
      expect(valid_station).to be_valid

      no_name_station = Station.create(dock_count: 42,
                                       city: "Denver",
                                       date: date)
      expect(no_name_station).not_to be_valid

      no_dock_count_station = Station.create(name: "stationicus",
                                             city: "Denver",
                                             date: date)
      expect(no_dock_count_station).not_to be_valid

      no_city_station = Station.create(name: "stationicus",
                                       dock_count: 42,
                                       date: date)
      expect(no_city_station).not_to be_valid

      no_date_station = Station.create(name: "stationicus",
                                       dock_count: 42,
                                       city: "Denver")
      expect(no_date_station).not_to be_valid
    end
  end

  describe "calculating station statistics" do
    it "returns the total count of all stations" do
      50.times do
        Station.create(name: Faker::Name.unique.name,
                       dock_count: rand(100),
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      end
      expect(Station.total).to be(50)
    end

    it "returns the average amount of bikes per station based on dock_count" do
      Station.create(name: Faker::Name.unique.name,
                       dock_count: 11,
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      Station.create(name: Faker::Name.unique.name,
                       dock_count: 3,
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      Station.create(name: Faker::Name.unique.name,
                       dock_count: 22,
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      expect(Station.average_bikes).to be(12)
    end

    it "returns the station with most bikes" do
      Station.create(name: Faker::Name.unique.name,
                       dock_count: 11,
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      Station.create(name: Faker::Name.unique.name,
                       dock_count: 3,
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      Station.create(name: "Big Ol' Station",
                       dock_count: 22,
                       city: Faker::Address.unique.city,
                       date: Faker::Date.backward(500))
      expect(Station.most_bikes[:dock_count]).to be(22)
      expect(Station.most_bikes[:name]).to eq("Big Ol' Station")
    end
  end
end
