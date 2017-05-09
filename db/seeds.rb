require 'csv'
require_relative '../app/models/csv_loader'
require_relative '../app/models/station'
require_relative '../app/models/city'
require_relative '../app/models/trip'
require_relative '../app/models/weather'

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
                  date: station[:date]
                  )
end

trip_data = loader.sanitize_trips('./db/csv/trip.csv')
count = 1
trip_data.each do |trip|
  count += 1
  puts "Seeding db_trips count: #{count}"

  start_station = Station.find(trip[:start_station_id])
  end_station = Station.find(trip[:start_station_id])

  Trip.create(id: trip[:id],
              duration: trip[:duration],
              start_date: trip[:start_date],
              start_station: start_station,
              end_date: trip[:end_date],
              end_station: end_station,
              bike_id: trip[:bike_id],
              subscription_type: trip[:subscription_type],
              zip_code: trip[:zip_code]
              )
end

CSV.foreach("db/csv/weather.csv", headers: true, header_converters: :symbol) do |row|
  weather_info = {}
  weather_info[:date] = Date.strptime(row[:date], "%m/%d/%y")
  weather_info[:max_temperature] = row[:max_temperature]
  weather_info[:mean_temperature] = row[:mean_temperature]
  weather_info[:min_temperature] = row[:min_temperature]
  weather_info[:mean_humidity] = row[:mean_humidity]
  weather_info[:mean_visibility] = row[:mean_visibility]
  weather_info[:mean_wind_speed] = row[:mean_wind_speed]
  weather_info[:precipitation] = row[:precipitation_inches]
  Weather.create(weather_info)

end
