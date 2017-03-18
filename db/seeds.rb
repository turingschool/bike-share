require 'csv'
require 'database_cleaner'
require './app/models/station.rb'
require './app/models/city.rb'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

contents = CSV.open 'db/csv/station.csv', headers: true, header_converters: :symbol

stations = []
cities = []

contents.each do |row|
  stations << Hash.new
  stations.last[:name] = row[:name]
  stations.last[:dock_count] = row[:dock_count]
  stations.last[:installation_date] = row[:installation_date]

  cities << row[:city]
  cities.uniq!

  stations.last[:city_id] = cities.find_index(row[:city]) + 1
end

cities.each do |city|
  puts "Creating city: #{city}"
  City.create(name: city)
end

stations.each do |station|
  puts "Creating station: #{station}"
  Station.create(station)
end
