require './app/models/station'
require 'csv'
require 'date'

Station.delete_all

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(name: row[:name], dock_count: row[:dock_count], city: row[:city], installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"))
end
