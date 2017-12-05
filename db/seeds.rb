require './app/models/station'
require './app/models/trip'
require './app/models/condition'

require 'csv'

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(id: row[:id], name: row[:name], dock_count: row[:dock_count], city: row[:city], installation_date: row[:installation_date])
end


trips = CSV.open './db/csv/trip_fixtures.csv', headers:true, header_converters: :symbol
trips.each do |row|
  start_date = DateTime.strptime(row[:start_date],'%m/%d/%Y' )
  end_date = DateTime.strptime(row[:end_date], '%m/%d/%Y')

  Trip.create!(
      duration: row[:duration],
      start_date: start_date,
      start_station_name: row[:start_station_name],
      start_station_id: row[:start_station_id],
      end_date: end_date,
      end_station_name: row[:end_station_name],
      end_station_id: row[:end_station_id],
      bike_id: row[:bike_id],
      subscription_type: row[:subscription_type],
      zip_code: row[:zip_code])
  # require 'pry';binding.pry
end

conditions = CSV.open './db/csv/weather.csv', headers:true, header_converters: :symbol
conditions.each do |row|
  date = DateTime.strptime(row[:date], '%m/%d/%Y')
#
  Condition.create!(
    date: date,
    max_temperature_f: row[:max_temperature_f],
    mean_temperature_f: row[:mean_temperature_f],
    min_temperature_f: row[:min_temperature_f],
    mean_humidity: row[:mean_humidity],
    mean_visibility_miles: row[:mean_visibility_miles],
    mean_wind_speed_mph: row[:mean_wind_speed_mph],
    precipitation_inches: row[:precipitation_inches])
  # require 'pry';binding.pry
end
