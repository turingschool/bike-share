require 'csv'
require './app/models/station'
require './app/models/city'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

CSV.foreach "db/csv/station.csv", headers: true, header_converters: :symbol do |row|
    city = City.find_or_create_by(name: row[:city])

    Station.create(
        name:               row[:name],
        dock_count:         row[:dock_count],
        city_id:            city.id,
        installation_date:  row[:installation_date]
    )
end
#our city_id is coming in as a string in our migraton
