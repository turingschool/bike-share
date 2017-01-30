require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/condition.rb'


def import_trip_csv
  CSV.foreach('db/csv/trip.csv', :headers=> true) do |row|
    Trip.create!(
    duration: row["duration"],
    start_date: row["start_date"],
    start_station: row["start_station_name"],
    end_date: row["end_date"],
    end_station: row["end_station_name"],
    bike_id: row["bike_id"],
    subscription: row["subscription_type"],
    zipcode: row["zip_code"])
  end
  p "Created #{Trip.count} trips."
end

def import_stations_csv
  CSV.foreach('db/csv/station.csv', :headers=> true) do |row|
    Station.create!({
    name: row["name"],
    dock_count: row["dock_count"],
    city: row["city"],
    installation_date: row["installation_date"]})
  end
  "Created #{Station.count} stations."
end

def import_conditions_csv
  CSV.foreach('db/csv/weather.csv', :headers => true) do |row|
    Condition.create!({
      date: row["date"],
      mean_temperature_f: row["mean_temperature_f"],
      min_temperature_f: row["min_temperature_f"],
      mean_humidity: row["mean_humidity"],
      mean_visibility_miles: row["mean_visibility_miles"],
      mean_wind_speed_mph: row["mean_wind_speed_mph"],
      precipitation_inches: row["precipitation_inches"]})
    end
    "Created #{Condition.count} conditions."
end
