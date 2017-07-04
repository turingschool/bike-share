require './app/models/station.rb'
require 'csv'

Station.destroy_all

stations = CSV.open "./db/csv/station.csv", headers: true, header_converters: :symbol

stations.each do |row|
  row = row.to_h
  row.delete(:lat)
  row.delete(:long)

  row[:installation_date] = Date.strptime(row[:installation_date], '%m/%d/%Y')
  # require 'pry' ; binding.pry
  Station.create(
    name: row[:name],
    dock_count: row[:dock_count],
    city: row[:city],
    installation_date: row[:installation_date]
    )
end
