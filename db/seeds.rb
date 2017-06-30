require 'csv'
require './app/models/station'

def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each do |row|
  stuff = row.to_h
  stuff.delete(:lat)
  stuff.delete(:long)
  stuff.delete(:city)
  values << stuff
  end

  seed_station_database(values)
end

def seed_station_database(csv)
  csv.each do |row|
    Station.create!(row)
  end
end

from_csv("/Users/jimmytruong/turing/2module/projects/bike-share/db/csv/station.csv")
