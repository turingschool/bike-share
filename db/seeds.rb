require './app/models/city'
require './app/models/station'
require 'date'
require 'CSV'

stations = CSV.open './db/csv/station.csv', headers: true, header_converters: :symbol

stations.each do |row|
  city = City.find_or_create_by(name: row[:city])

  Station.create(name:              row[:name],
                 dock_count:        row[:dock_count],
                 install_date: Date.strptime(row[:installation_date], "%m/%d/%Y"),
                 city_id:           city.id
                 )
end