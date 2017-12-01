require './app/models/station'
require './app/models/trips'
require 'csv'
require 'date'

Station.delete_all

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(name: row[:name], dock_count: row[:dock_count], city: row[:city], installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"))
end

Trip.delete_all

trips = CSV.open './db/csv/trip.csv', headers:true, header_converters: :symbol
trips.each do |row|
  Trip.create!(duration: row[:duration], start_date: DateTime.strptime(row[:start_date], "%m/%d/%Y"), start_station: row[:start_station], end_date: DateTime.strptime(row[:end_date], "%m/%d/%Y"), end_station: row[:end_station], bike_id: row[:bike_id], subscription: row[:subscription_type], zip_code: row[:zip_code])
end
