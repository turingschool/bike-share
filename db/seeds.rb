require 'csv'
require './app/models/station'
require './app/models/city'

def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each {|row| values << row.to_h }
  values
end

def seed_city_database(file_path)
  csv = from_csv(file_path)
  cities = csv.each do |city|
    city.keep_if {|k,v| k == :city}
  end
  cities.uniq.each {|city| City.create!(city)}
end

def seed_station_database(file_path)
  stations = from_csv(file_path)
  stations.each do |station|
    city = City.find_by(city: station[:city])
    station.delete_if { |k,v| k == :lat || k == :long || k == :city}
    city.stations.create(station)
  end
end

def seed_dates_database(file_path)
  dates = from_csv(file_path)
  dates.each do |date|
    date.keep_if {|k,v| k == :date}
  end
  dates.each do |date|
    list = date.values
    date[list]

end

def seed_trips_database(file_path)
  trips = from_csv(file_path)
  trips.each do |trip|
    trip.delete_if {|k,v| k == :zipcode}
  end
end

seed_city_database("db/csv/station.csv")
seed_station_database("db/csv/station.csv")
seed_dates_database("")
seed_trips_database("db/csv/trip.csv")
