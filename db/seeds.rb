require './app/models/station'
require './app/models/trip'
require './app/models/condition'
require 'date'
require 'csv'
require 'pry'

station_file = "./db/csv/station.csv"
trip_file = "./db/csv/trip_fixture.csv"
condition_file = "./db/csv/weather.csv"

stations = CSV.open(station_file, headers: true).readlines
trips = CSV.open(trip_file, headers: true).readlines
conditions = CSV.open(condition_file, headers: true).readlines

Station.destroy_all
Trip.destroy_all
Condition.destroy_all

stations.each do |station|
  Station.create(name: station['name'],
                 dock_count: station['dock_count'],
                 city: station['city'],
                 installation_date: Date.strptime(station['installation_date'], "%m/%d/%Y")
                )
end

trips.each do |trip|

  Trip.create(duration: trip["duration"],
              start_date: DateTime.strptime(trip["start_date"],"%m/%d/%Y"),
              start_station_name: trip["start_station_name"],
              start_station_id: trip["start_station_id"],
              end_date: DateTime.strptime(trip["end_date"],"%m/%d/%Y"),
              end_station_name: trip["end_station_name"],
              end_station_id: trip["end_station_id"],
              bike_id: trip["bike_id"],
              subscription_type: trip["subscription_type"],
              zip_code: trip["zip_code"],

              # condition_id: Condition.find_by(date: trip["start_date"]))
end

conditions.each do |condition|
  unless Condition.find_by(date: DateTime.strptime(condition["date"], "%m/%d/%Y")) != nil
    Condition.create!(date: DateTime.strptime(condition["date"], "%m/%d/%Y"),
                      max_temperature_f: condition["max_temperature_f"],
                      mean_temperature_f: condition["mean_temperature_f"],
                      min_temperature_f: condition["min_temperature_f"],
                      mean_humidity: condition["mean_humidity"],
                      mean_visibility_miles: condition["mean_visibility_miles"],
                      mean_wind_speed_mph: condition["mean_wind_speed_mph"],
                      precipitation_inches: condition["precipitation_inches"])
  end
end

puts "db populated with #{station_file}"
puts "db populated with #{trip_file}"
puts "db populated with #{condition_file}"
