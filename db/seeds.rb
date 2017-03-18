require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'

Station.destroy_all
City.destroy_all

stations = ( CSV.open'db/csv/station.csv', headers: true, header_converters: :symbol )

stations.each do |station|
  city = City.find_or_create_by(name: station[:city])

  Station.create( name:              station[:name],
                  dock_count:        station[:dock_count].to_i,
                  installation_date: station[:installation_date],
                  city_id:           city.id
                )
end