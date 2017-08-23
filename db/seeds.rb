require 'csv'
require_relative '../app/helpers/csv_loader'
require_relative '../app/models/station'
require_relative '../app/models/city'
require_relative '../app/models/trip'
require_relative '../app/models/condition'
require 'fastercsv'
require 'activerecord-import'

def run(record_one, record_two, record_three)
  loader = CSVLoader.new
  dataset_1 = loader.sanitize_station(record_one)
  dataset_2 = loader.sanitize_weather(record_two)
  dataset_3 = loader.sanitize_trips(record_three)

  batch,batch_size = [], 1_000
  CSV.foreach(dataset_1, :headers => true) do |row|
    batch << Station.new(row)

    if batch.size >= batch_size
      Station.import batch
      batch = []
    end
  end
  Station.import batch
end

station_data = loader.sanitize_station('./db/csv/station.csv')
binding.pry
station_data.each do |station|
  puts "Seeding db_stations with: #{station[:name]}"

  city = City.where(name: station[:city]).first_or_create

  Station.create(id: station[:id],
                  name: station[:name],
                  dock_count: station[:dock_count],
                  city_id: city.id,
                  installation_date: station[:installation_date]
                  )
end

weather_data = loader.sanitize_weather('./db/csv/weather.csv')
count = 0
weather_data.each do |condition|
  count += 1
  puts "Seeding db_conditions count: #{count}"

  Condition.create(date: condition[:date],
                   max_temperature: condition[:max_temperature],
                   mean_temperature: condition[:mean_temperature],
                   min_temperature: condition[:min_temperature],
                   mean_humidity: condition[:mean_humidity],
                   mean_visibility: condition[:mean_visibility],
                   mean_wind_speed: condition[:mean_wind_speed],
                   precipitation: condition[:precipitation]
                   )
end

trip_data = loader.sanitize_trips('./db/csv/trip.csv')
count = 0
trip_data.each do |trip|
  count += 1
  puts "Seeding db_trips count: #{count}"

  start_station = Station.find(trip[:start_station_id])
  end_station = Station.find(trip[:start_station_id])
  condition = Condition.id_by_date(trip[:start_date])

  Trip.create(duration: trip[:duration],
              start_date: trip[:start_date],
              start_station_id: start_station.id,
              end_date: trip[:end_date],
              end_station_id: end_station.id,
              bike_id: trip[:bike_id],
              subscription_type: trip[:subscription_type],
              zip_code: trip[:zip_code],
              condition_id: condition
              )
end