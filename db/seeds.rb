require './app/models/station.rb'
require './app/models/city.rb'
require 'csv'

City.destroy_all
Station.destroy_all


stations = CSV.open 'db/csv/station.csv',
headers: true, header_converters: :symbol


stations.each do |row|
  city = City.find_or_create_by!(name: row[:city])
  city.stations.create(id: row[:id],
                 name: row[:name],
                 city_id: city.id,
                 dock_count: row[:dock_count],
                 lat: row[:lat],
                 long: row[:long],
                 installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y')
                 )
  end
