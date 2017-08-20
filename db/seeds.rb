require 'csv'
require_relative '../app/helpers/csv_loader'
require_relative '../app/models/station'
require_relative '../app/models/city'

loader = CSVLoader.new

station_data = loader.sanitize_station('./db/csv/station.csv')
station_data.each do |station|
  puts "Seeding db_stations with: #{station[:name]}"

  if City.find_by(name: station[:city]).nil?
    city = City.create(name: station[:city])
  else
    city = City.find_by(name: station[:city])
  end

  Station.create(id: station[:id],
                  name: station[:name],
                  dock_count: station[:dock_count],
                  city_id: city.id,
                  installation_date: station[:installation_date]
                  )
end

trip_data = loader.sanitize_trips('./db/csv/trip.csv')
trip_data.each do |trip|
  puts "Seeding db_trips with: #{trip[:start_station_id]}"

  if Station.find_by(id: station[:start_station_id]).nil?
    station = Station.create(id: station[:start_station_id])
  else
    station = Station.find_by(id: station[:start_station_id])
  end

  Trip.create(duration: trip[:duration],
              start_date: trip[:start_date],
              start_station_id: trip[:start_station_id],
              end_date: trip[:end_date],
              end_station_id: trip[:end_station_id],
              bike_id: trip[:bike_id],
              subscription_type: trip[:subscription_type],
              zip_code: trip[zip_code]
              )
end
