require 'csv'
require_relative '../app/models/city'
require_relative '../app/models/station'
require_relative '../app/models/bike'
require_relative '../app/models/subscription_type'
require_relative '../app/models/zip_code'
require_relative '../app/models/trip'
require_relative '../app/models/condition'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

stations = (CSV.open'db/csv/station.csv', headers: true, header_converters: :symbol)

stations.each do |station|
  Station.create!(name:             station[:name],
                 dock_count:        station[:dock_count].to_i,
                 installation_date: Date.strptime(station[:installation_date], "%m/%d/%Y"),
                 city:              City.find_or_create_by(name: station[:city]))
end

trips = (CSV.open'db/fixtures/trips_fixture.csv', headers: true, header_converters: :symbol)

trips.each do |trip|
  next unless Station.find_by(name: trip[:start_station_name]) && Station.find_by(name: trip[:end_station_name])

  Trip.create!(duration:            trip[:duration],
              start_date:           Date.strptime(trip[:start_date], "%m/%d/%Y"),
              start_station_id:     Station.find_by(name: trip[:start_station_name]).id,
              end_date:             Date.strptime(trip[:end_date], "%m/%d/%Y"),
              end_station_id:       Station.find_by(name: trip[:end_station_name]).id,
              bike:                 Bike.find_or_create_by(bike_number: trip[:bike_id]),
              subscription_type:    SubscriptionType.find_or_create_by(subscription_type: trip[:subscription_type]),
              zip_code:             ZipCode.find_or_create_by(zip_code: trip[:zip_code]))
end

conditions = (CSV.open'db/csv/weather.csv', headers: true, header_converters: :symbol)

conditions.each do |condition|
  next unless condition[:zip_code] == "94107"

  Condition.create!(date:             Date.strptime(condition[:date], "%m/%d/%Y"),
                    max_temp:         condition[:max_temperature_f],
                    mean_temp:        condition[:mean_temperature_f],
                    min_temp:         condition[:min_temperature_f],
                    mean_humidity:    condition[:mean_humidity],
                    mean_visibility:  condition[:mean_visibility_miles],
                    mean_wind:        condition[:mean_wind_speed_mph],
                    precipitation:    condition[:precipitation_inches])
end