require './app/models/station.rb'
require './app/models/bikesharedate.rb'
require './app/models/trip.rb'
require './app/models/zipcode.rb'
require 'csv'
require 'pry'

def pick_rows(path, rows)
  table = CSV.table(path)
  rows.each do |row_header|
    table.delete(row_header)
    puts 'deleting'
  end
  table
end

Station.destroy_all
system 'Say "Finished Destroying Stations"'
Trip.destroy_all
system 'Say "Finished Destroying Trips"'

stations = pick_rows("./db/csv/station.csv", [:lat, :long])
trips = CSV.open "./db/csv/trip.csv", headers: true, header_converters: :symbol

stations.each do |row|
  row = row.to_h
  row[:installation_date_id] = BikeShareDate.seed_by_date(row.delete(:installation_date))
  p row
  Station.create!(row)
end

system 'Say "Finished Seeding Stations"'

start_time = Time.now

trips.each do |row|
  row = row.to_h
  row[:start_date_id] = BikeShareDate.seed_by_date(row.delete(:start_date))
  row[:start_station_id] = Station.seed_by_name(row.delete(:start_station_name))
  row[:end_date_id] = BikeShareDate.seed_by_date(row.delete(:end_date))
  row[:end_station_id] = Station.seed_by_name(row.delete(:end_station_name))
  row[:zipcode_id] = Zipcode.seed_by_zip(row.delete(:zip_code))
  p row
  Trip.create!(row)
end

system 'Say "Finished Seeding Trips"'

puts Time.now - start_time
