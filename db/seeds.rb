require './app/models/station'
require './app/models/trip'
require 'date'
require 'csv'
require 'pry'

# Station.create(name: "Mission", dock_count: 2, city: "SF", installation_date: Date.parse("2001-02-02"))
# Station.create(name: "Haight Ashbury", dock_count: 2, city: "SF", installation_date: Date.parse("2010-02-02"))
# Station.create(name: "Golden Gate Park", dock_count: 2, city: "SF", installation_date: Date.parse("2011-03-04"))
station_file = "./db/csv/station.csv"
trip_file = "./db/csv/trip_fixture.csv"

stations = CSV.open(station_file, headers: true).readlines
trips = CSV.open(trip_file, headers: true).readlines

Station.destroy_all
Trip.destroy_all

stations.each do |station|
  Station.create(name: station['name'],
                 dock_count: station['dock_count'],
                 city: station['city'],
                 installation_date: station['installation_date'])
end

trips.each do |trip|
  Trip.create(duration: trip["duration"],
              start_date: trip["start_date"],
              start_station_name: trip["start_station_name"],
              start_station_id: trip["start_station_id"],
              end_date: trip["end_date"],
              end_station_name: trip["end_station_name"],
              end_station_id: trip["end_station_id"],
              bike_id: trip["bike_id"],
              subscription_type: trip["subscription_type"],
              zip_code: trip["zip_code"])
end

puts "db populated with #{station_file}"
puts "db populated with #{trip_file}"

#might need to add lat long variables
