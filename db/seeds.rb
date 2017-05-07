require 'csv'
require_relative '../app/models/csv_loader'
require_relative '../app/models/station'

loader = CSVLoader.new
data = loader.sanitize_station('./db/csv/station.csv')

data.each do |station|
  puts "Seeding db_stations with: #{station[[:name]]}"

  Station.create!(
                    name: station[[:name]],
                    dock_count: station[[:dock_count]],
                    city: station[[:city]],
                    date: station[[:date]]
                  )
end