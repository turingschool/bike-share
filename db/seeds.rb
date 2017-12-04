require './app/models/station'
require './app/models/trips'
require 'csv'
require 'date'
require 'pry'

Station.delete_all

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(name: row[:name], dock_count: row[:dock_count], city: row[:city], installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"))
end

Trip.delete_all

trips = CSV.open './db/fixture/trip_fixture.csv', headers:true, header_converters: :symbol
trips.each do |row|

  if Station.find_by(name: row[:start_station_name])
    start_station_id = Station.find_by(name: row[:start_station_name]).id
  else
    start_station_id = "0"
  end

  if Station.find_by(name: row[:end_station_name])
    end_station_id = Station.find_by(name: row[:end_station_name]).id
  else
    end_station_id = "0"
  end
  
  zipcode = row[:zip_code].to_s.rjust(5, "0")[0..4]
  Trip.create!(duration: row[:duration], start_date: DateTime.strptime(row[:start_date], "%m/%d/%Y"), start_station_name: row[:start_station_name], start_station_id: start_station_id, end_date: DateTime.strptime(row[:end_date], "%m/%d/%Y"), end_station_name: row[:end_station_name], end_station_id: end_station_id, bike_id: row[:bike_id], subscription: row[:subscription_type], zip_code: zipcode)
end
