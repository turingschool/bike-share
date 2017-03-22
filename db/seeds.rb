require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/trip.rb'
require './app/models/bike.rb'
require 'CSV'
require 'Date'

CSV.foreach("./db/csv/station.csv", :headers => true) do |row|

  city_name = row["city"]
  date = row["installation_date"]

  row['installation_date'] = Date.strptime(date, '%m/%d/%Y')

  city = City.find_or_create_by(name: city_name)

  row.delete("city")
  row.delete("id")

  city.stations.create!(row.to_h)
end

CSV.foreach("./db/csv/trips_truncated.csv", :headers => true) do |row|
  bin = row["bike_id"]
  start_date = row["start_date"]
  end_date = row["end_date"]

  row['start_date'] = DateTime.strptime(start_date, '%m/%d/%Y %k:%M')
  row['end_date'] = DateTime.strptime(end_date, '%m/%d/%Y %k:%M')

  row['subscription_type'] = row['subscription_type'].downcase

  start_station = Station.find_by(name: row["start_station_name"])

  end_station = Station.find_by(name: row["end_station_name"])

  next if start_station.nil? || end_station.nil?

  row["start_station_id"] = start_station.id
  row["end_station_id"] = end_station.id

  bike = Bike.find_or_create_by(bin: bin)

  row.delete("start_station_name")
  row.delete("end_station_name")
  row.delete("bike_id")
  row.delete("id")

  bike.trips.create!(row.to_h)
end
# id,duration,start_date,start_station_name,start_station_id,end_date,end_station_name,end_station_id,bike_id,subscription_type,zip_code
#
# start_station, end_station, start_date, end_date, duration, subscyption
