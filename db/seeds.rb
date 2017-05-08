require 'CSV'
require './app/models/city.rb'
require './app/models/station.rb'

stations = CSV.open './db/csv/station.csv', headers: true, header_converters: :symbol

stations.each do |row|
  city = City.find_or_create_by(name: row[:city])
  city.stations.create({name: row[:name],
                        dock_count: row[:dock_count],
                        install_date: row[:installation_date]})
end