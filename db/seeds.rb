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
  cities = csv.each do |row|
    row.keep_if {|k,v| k == :city}
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

seed_city_database("db/csv/station.csv")
seed_station_database("db/csv/station.csv")
