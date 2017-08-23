require_relative '../app/helpers/csv_loader'
require_relative '../app/models/station'
require_relative '../app/models/city'
require_relative '../app/models/trip'
require_relative '../app/models/condition'
require 'fastercsv'
require "activerecord-import/base"

def fast_seed_station(data)
  count = 0
  batch,batch_size = [], 1_000
  data.each do |row|
    # binding.pry
    puts "Seeded #{count} records (station)"
    count += 1

    city = City.where(name: row[:name]).first_or_create


    batch << Station.new(id: row[:id].to_i,
                         name: row[:name],
                         dock_count: row[:dock_count].to_i,
                         city_id: city.id,
                         installation_date: row[:installation_date].to_date
                         )
    if batch.size >= batch_size
      Station.import batch
      batch = []
    end
  end
  # binding.pry
  Station.import batch
end

def fast_seed_condition(data)
  count = 0
  data.each do |row|
    puts "Seeded #{count} records (condition)"
    count += 1

    c = Condition.create(date: row[:date],
                         max_temperature: row[:max_temperature],
                         mean_temperature: row[:mean_temperature],
                         min_temperature: row[:min_temperature],
                         mean_humidity: row[:mean_humidity],
                         mean_visibility: row[:mean_visibility],
                         mean_wind_speed: row[:mean_wind_speed],
                         precipitation: row[:precipitation],
                         )
    # binding.pry
    t = Trip.where(start_date: row[:date]).first
    ConditionTrip.create(condition_id: c.id, trip_id: t.id)
  end
  # binding.pry
end

def fast_seed_trip(data)
  count = 0
  batch,batch_size = [], 10_000
  data.each do |row|
    count += 1
    puts "Seeded #{count} records (trip)"

    start_station = Station.find(row[:start_station_id])
    end_station = Station.find(row[:start_station_id])

    t = Trip.new(duration: row[:duration],
                 start_date: row[:start_date],
                 start_station_id: start_station.id,
                 end_date: row[:end_date],
                 end_station_id: end_station.id,
                 bike_id: row[:bike_id],
                 subscription_type: row[:subscription_type],
                 zip_code: row[:zip_code]
                 )
    batch << t
    if batch.size >= batch_size
      Trip.import batch
      batch = []
    end
  end
  Trip.import batch
end

def stations
  @loader = CSVLoader.new
  @loader.sanitize_station('./db/csv/station.csv')
end

def trips
  @loader.sanitize_trips('./db/csv/trip.csv')
end

def conditions
  @loader.sanitize_weather('./db/csv/weather.csv')
end

def jam
  count = 0
  Trip.all.each do |trip|
    puts "Made #{count} relations"
    count += 1
    # binding.pry
    c_id = Condition.where(date: trip[:start_date]).first.id
    ConditionTrip.where("condition_id = #{c_id}").each do |record|
      record.update_attribute(:trip_id, trip.id)
      binding.pry
    end
  end
end

def run
  fast_seed_station(stations)
  fast_seed_trip(trips)
  fast_seed_condition(conditions)
  # jam
end

run
