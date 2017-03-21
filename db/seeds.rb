require './app/models/city'
require './app/models/station'
require './app/models/trip'
require 'pry'
require 'csv'

# binding.pry

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

CSV.foreach("db/csv/trip.csv", headers: true, header_converters: :symbol) do |trip_info|
  # binding.pry
  trip_info[:start_date] = DateTime.strptime(trip_info[:start_date], "%m/%d/%Y %H:%M")
  trip_info[:end_date] = DateTime.strptime(trip_info[:end_date], "%m/%d/%Y %H:%M")
  trip_info.delete(:start_station_name)
  trip_info.delete(:end_station_name
  trip_info = trip_info.to_hash
  Trip.create(trip_info)
 end
