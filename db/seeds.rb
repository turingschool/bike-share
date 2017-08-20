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
