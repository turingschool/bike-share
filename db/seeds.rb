require './app/models/station.rb'
require './app/models/city.rb'

city = City.create!(name: 'Denver')
city.stations.create!(lat: 37.329732, long: -121.90178200000001, name: 'Turing Station', dock_count: 12, installation_date: Date.parse('8/6/2013'))
