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
  # puts city.name
  # puts station.name
  end
  require "pry"; binding.pry

  # do something with city to convert city to city_id
  #   City.create()

# Station.create(name: "Navy Pier", dock_count: "10",  installation_date: "20160203", city_id: 2)
# Station.create(name: "Carl", dock_count: "107", installation_date: "20160204", city_id: 1)
# Station.create(name: "HelloStation", dock_count: "120",  installation_date: "20160206", city_id: 2)
# Station.create(name: "DenverStation", dock_count: "420", installation_date: "20160206", city_id: 3)
#
#
# City.create(name: "Denver")
# City.create(name: "Chicago")
# City.create(name: "Seaver")
