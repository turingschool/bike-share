require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require_relative '../app/models/bike'
require_relative '../app/models/subscription_type'
require_relative '../app/models/zip_code'
require_relative '../app/models/trip'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

stations = (CSV.open'db/csv/station.csv', headers: true, header_converters: :symbol)

stations.each do |station|
  # city = City.find_or_create_by(name: station[:city])

  Station.create(name:              station[:name],
                 dock_count:        station[:dock_count].to_i,
                 installation_date: Date.strptime(station[:installation_date], "%m/%d/%Y"),
                 city:              City.find_or_create_by(name: station[:city]))
end

trips = (CSV.open'db/fixtures/trips_fixture.csv', headers: true, header_converters: :symbol)

trips.each do |trip|
  next unless Station.find_by(name: trip[:start_station_name]) && Station.find_by(name: trip[:end_station_name])

  Trip.create(duration:             trip[:duration],
              start_date:           Date.strptime(trip[:start_date], "%m/%d/%Y"),
              start_station_id:     Station.find_by(name: trip[:start_station_name]).id,
              end_date:             Date.strptime(trip[:end_date], "%m/%d/%Y"),
              end_station_id:       Station.find_by(name: trip[:end_station_name]).id,
              bike:                 Bike.find_or_create_by(bike_number: trip[:bike_id]),
              subscription_type:    SubscriptionType.find_or_create_by(subscription_type: trip[:subscription_type]),
              zip_code:             ZipCode.find_or_create_by(zip_code: trip[:zip_code]))
end