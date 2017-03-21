require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require_relative '../app/models/trip'
require_relative '../app/models/zipcode'
require_relative '../app/models/subscription'
require 'database_cleaner'
require 'date'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

contents = CSV.open("db/csv/station.csv", headers: true, header_converters: :symbol)

contents.each do |row|
  city = City.find_or_create_by(city: row[:city])


  Station.create(name: row[:name] ,
                 dock_count: row[:dock_count],
                 installation_date: Date.strptime(row[:installation_date], "%m/%d/%y").to_s,
                 city_id: city.id
                 )

end

trips = CSV.open("db/csv/trip.csv", headers: true, header_converters: :symbol)

trips.each do |row|
  zipcode = Zipcode.find_or_create_by(zipcode: row[:zipcode])

  subscription = Subscription.find_or_create_by(subscription: row[:subscription])

  Trip.create(duration: row[:duration],
              start_date: DateTime.strptime(row[:start_date], "%m/%d/%Y %H:%M").to_s,
              start_station_id: row[:start_station_id],
              end_date: DateTime.strptime(row[:end_date], "%m/%d/%Y %H:%M").to_s,
              end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              subscription_type: row[:subscription_type],
              zipcode_id: zipcode.id,
              subscription_id: subscription.id
                 )
end
