require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require_relative '../app/models/trip'
require_relative '../app/models/zipcode'
require_relative '../app/models/subscription'
require_relative '../app/models/bike'
require 'database_cleaner'
require 'date'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

contents = CSV.open("db/fixtures/station.csv", headers: true, header_converters: :symbol)

contents.each do |row|
  city = City.find_or_create_by(city: row[:city])


  Station.create(name: row[:name] ,
                 dock_count: row[:dock_count],
                 installation_date: Date.strptime(row[:installation_date], "%m/%d/%y").to_s,
                 city_id: city.id
                 )

end

trips = CSV.open("db/fixtures/trip.csv", headers: true, header_converters: :symbol)

trips.each do |row|
  zip_code = Zipcode.find_or_create_by(zip_code: row[:zip_code])
  bike = Bike.find_or_create_by(bike_number: row[:bike_id].to_i)
  # binding.pry

  subscription = Subscription.find_or_create_by(subscription: row[:subscription_type])
# binding.pry
  Trip.create(duration: row[:duration],
              start_date: DateTime.strptime(row[:start_date], "%m/%d/%Y %H:%M").to_s,
              start_station_id: row[:start_station_id],
              end_date: DateTime.strptime(row[:end_date], "%m/%d/%Y %H:%M").to_s,
              end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              zipcode_id: zip_code.id,
              subscription_id: subscription.id
                 )
end
