require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

stations = (CSV.open'db/csv/station.csv', headers: true, header_converters: :symbol)

stations.each do |station|
  city = City.find_or_create_by(name: station[:city])

  Station.create(name:              station[:name],
                 dock_count:        station[:dock_count].to_i,
                 installation_date: Date.strptime(station[:installation_date], "%m/%d/%Y"),
                 city_id:           city.id)
end