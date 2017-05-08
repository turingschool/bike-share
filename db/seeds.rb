require 'csv'
require_relative '../app/models/csv_loader'
require_relative '../app/models/station'
require_relative '../app/models/city'
require_relative '../app/models/trip'

loader = CSVLoader.new

station_data = loader.sanitize_station('./db/csv/station.csv')
station_data.each do |station|
  puts "Seeding db_stations with: #{station[[:name]]}"

  if City.find_by(name: station[[:city]]).nil?
    city = City.create(name: station[[:city]])
  else
    city = City.find_by(name: station[[:city]])
  end

  Station.create(name: station[[:name]],
                  dock_count: station[[:dock_count]],
                  city_id: city.id,
                  date: station[[:date]]
                  )
end

# trip_data = loader.sanitize_trips('./db/csv/trip.csv')
# trip_data.each do |trip|
#   puts "Seeding db_trips with trip_id #{trip[[:id]]}"

#   Trip.create(duration: trip[[:duration]],
#                start_date: trip[[:start_date]],
#                start_station: trip[[:start_station_id]],
#                end_date: trip[[:end_date]],
#                end_station: trip[[:end_station_id]],
#                bike_id: trip[[:bike_id]],
#                zip_code: trip[[:zip_code]]
#                )
# end