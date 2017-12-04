require './app/models/station'
require './app/models/trips'
require './app/models/condition'
require 'csv'
require 'date'
require 'pry'

Station.delete_all

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(name:              row[:name],
                  dock_count:        row[:dock_count],
                  city:              row[:city],
                  installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"))
end

Trip.delete_all

trips = CSV.open './db/fixture/trip_fixture.csv', headers:true, header_converters: :symbol
trips.each do |row|
  zipcode = row[:zip_code].to_s.rjust(5, "0")[0..4]
  Trip.create!(duration:           row[:duration],
               start_date:         DateTime.strptime(row[:start_date], "%m/%d/%Y"),
               start_station_name: row[:start_station_name],
               start_station_id:   row[:start_station_id],
               end_date:           DateTime.strptime(row[:end_date], "%m/%d/%Y"),
               end_station_name:   row[:end_station_name],
               end_station_id:     row[:end_station_id],
               bike_id:            row[:bike_id],
               subscription:       row[:subscription_type],
               zip_code:           zipcode)
end

Condition.delete_all

conditions = CSV.open './db/csv/weather.csv', headers:true, header_converters: :symbol
conditions.each do |row|
  Condition.create!(date:        row[:date],
          max_temperature:       row[:max_temperature_f],
          mean_temperature:   row[:mean_temperature_f],
          min_temperature: row[:min_temperature_f],
          mean_humidity: row[:mean_humidity],
          mean_visibility: row[:mean_visibility_miles],
          mean_wind_speed: row[:mean_wind_speed_mph],
          precipitation: row[:precipitation_inches])
end
  puts "Seed complete"