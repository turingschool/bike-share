require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/weather_condition.rb'
require './app/models/trip.rb'
require './app/models/bike.rb'
require 'CSV'
require 'Date'

CSV.foreach("./db/csv/station.csv", :headers => true) do |row|

  city_name = row["city"]
  date = row["installation_date"]

  row['installation_date'] = Date.strptime(date, '%m/%d/%Y')

  city = City.find_or_create_by(name: city_name)

  row.delete("city")
  row.delete("id")

  city.stations.create!(row.to_h) unless Station.exists?(name: row['name'])
end

puts 'stations seeded'

CSV.foreach("./db/csv/trips_truncated.csv", :headers => true) do |row|
  bin = row["bike_id"]
  start_date = row["start_date"]
  end_date = row["end_date"]

  row['start_date'] = DateTime.strptime(start_date, '%m/%d/%Y %k:%M')
  row['end_date'] = DateTime.strptime(end_date, '%m/%d/%Y %k:%M')

  row['subscription_type'] = row['subscription_type'].downcase

  start_station = Station.find_by(name: row["start_station_name"])

  end_station = Station.find_by(name: row["end_station_name"])

  next if start_station.nil? || end_station.nil?

  row["start_station_id"] = start_station.id
  row["end_station_id"] = end_station.id

  bike = Bike.find_or_create_by(bin: bin)

  row.delete("start_station_name")
  row.delete("end_station_name")
  row.delete("bike_id")
  row.delete("id")

  bike.trips.create!(row.to_h)
end

puts 'trips seeded'

CSV.foreach("./db/csv/weather.csv", :headers => true) do |row|

  if row['zip_code'] == '94107'

  date = row['date']
  row['date'] = Date.strptime(date, '%m/%d/%Y')

  weather = WeatherCondition.find_or_create_by(date: date)

  row.delete('max_dew_point_f')
  row.delete('mean_dew_point_f')
  row.delete('min_dew_point_f')
  row.delete('max_humidity')
  row.delete('max_sea_level_pressure_inches')
  row.delete('mean_sea_level_pressure_inches')
  row.delete('min_sea_level_pressure_inches')
  row.delete('min_humidity')
  row.delete('max_visibility_miles')
  row.delete('min_visibility_miles')
  row.delete('max_wind_Speed_mph')
  row.delete('min_visibility_miles')
  row.delete('max_gust_speed_mph')
  row.delete('cloud_cover')
  row.delete('events')
  row.delete('wind_dir_degrees')
  row.delete('zip_code')

  weather.update_attributes(row.to_h)

  end
end

puts 'weather seeded'
