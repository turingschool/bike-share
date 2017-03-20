require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require_relative '../app/models/trip'
require_relative '../app/models/zipcode'
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

contents.each do |row|
  zipcode = Zipcode.find_or_create_by(zipcode: row[:zipcode])

  # binding.pry
  Trip.create(duration: row[:duration],
              start_date: row[:start_date],
              start_station_id: row[:start_station_id],
              end_date: row[:end_date],
              end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              subscription_type: row[:subscription_type],
              zipcode_id: zipcode.id
                 )

end
