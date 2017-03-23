require './app/models/city'
require './app/models/station'
require './app/models/trip'
require './app/models/weather'
require 'pry'
require 'csv'

CSV.foreach("db/csv/station.csv", headers: true, header_converters: :symbol) do |row|

  row = row.to_hash
  puts row
  row.delete(:lat)
  row.delete(:long)
  row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
  #create city, get id, pass in
  City.create(name: row[:city])
  row[:city_id] = City.find_by(name: row[:city]).id
  row.delete(:city)
  Station.create(row)
  puts Station.all.last.name
  puts Station.all.last.city
end

CSV.foreach("db/csv/weather.csv", headers: true, header_converters: :symbol) do |row|
  weather_info = {}
  weather_info[:date] = Date.strptime(row[:date], "%m/%d/%Y")
  weather_info[:max_temperature] = row[:max_temperature_f]
  weather_info[:mean_temperature] = row[:mean_temperature_f]
  weather_info[:min_temperature] = row[:min_temperature_f]
  weather_info[:mean_humidity] = row[:mean_humidity]
  weather_info[:mean_visibility] = row[:mean_visibility_miles]
  weather_info[:mean_wind_speed] = row[:mean_wind_speed_mph]
  weather_info[:precipitation] = row[:precipitation_inches]
  Weather.create(weather_info)

end


CSV.foreach("db/csv/trip.csv", headers: true, header_converters: :symbol) do |trip_info|
  trip_info[:start_date] = DateTime.strptime(trip_info[:start_date], "%m/%d/%Y %H:%M")
  trip_info[:end_date] = DateTime.strptime(trip_info[:end_date], "%m/%d/%Y %H:%M")
  trip_info.delete(:start_station_name)
  trip_info.delete(:end_station_name)
  trip_info = trip_info.to_hash
  Trip.create(trip_info)
 end
