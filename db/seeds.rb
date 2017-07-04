require './app/models/station.rb'
require './app/models/bikesharedate.rb'
require './app/models/trip.rb'
require './app/models/zipcode.rb'
require 'csv'
require 'pry'

# This method is written with weather conditions in mind, so we don't have to
# delete keys on every iteration when seeding
def delete_columns(path, column_headers)
  table = CSV.table(path)
  column_headers.each do |column_header|
    table.delete(row_header) #deletes
  end
  table
end

Station.destroy_all
system 'Say "Finished Destroying Stations"'
Trip.destroy_all
system 'Say "Finished Destroying Trips"'

stations = delete_columns("./db/csv/station.csv", [:lat, :long])
trips = CSV.open "./db/csv/trip.csv", headers: true, header_converters: :symbol

stations.each do |row|
  row = row.to_h
  row[:installation_date_id] = BikeShareDate.seed_by_date(row.delete(:installation_date))
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
  row[:zipcode_id] = Zipcode.create_zipcode(row.delete(:zip_code))
  Trip.create!(row)
end

system 'Say "Finished Seeding Trips"'

puts Time.now - start_time
