require './app/models/station'
require 'date'
require 'csv'
require 'pry'

# Station.create(name: "Mission", dock_count: 2, city: "SF", installation_date: Date.parse("2001-02-02"))
# Station.create(name: "Haight Ashbury", dock_count: 2, city: "SF", installation_date: Date.parse("2010-02-02"))
# Station.create(name: "Golden Gate Park", dock_count: 2, city: "SF", installation_date: Date.parse("2011-03-04"))
current_file = "./db/csv/station.csv"
csv = CSV.open("./db/csv/station.csv", headers: true).readlines

Station.destroy_all

csv.each do |station|
  Station.create(name: station['name'], dock_count: station['dock_count'], 
                city: station['city'], installation_date: station['installation_date'] )
end

puts "db populated with #{current_file}"

#might need to add lat long variables
