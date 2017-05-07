require './app/models/station.rb'
require './app/models/city.rb'
require 'csv'

Station.destroy_all

def read_csv(file)
  CSV.open(file, headers: true, header_converters: :symbol)
end

stations = read_csv('./db/csv/station.csv')
stations.each do |station|
  city = City.find_or_create_by(name: station[:city])
  Station.create!(name: station[:name],
                dock_count: station[:dock_count],
                city_id: city.id,
                installation_date: Date.strptime(station[:installation_date],'%m/%d/%Y'),
                longitude: station[:long],
                latitude: station[:lat])
end
