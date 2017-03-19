require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require 'database_cleaner'
require 'date'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

contents = CSV.open("db/csv/station.csv", headers: true, header_converters: :symbol)

contents.each do |row|
  city = City.find_or_create_by(city: row[:city])

  # binding.pry
  Station.create(name: row[:name],
                 dock_count: row[:dock_count],
                 installation_date: Date.strptime(row[:installation_date], "%m/%d/%y").to_s,
                 city_id: city.id
                 )

end
