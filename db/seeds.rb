require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/weather_condition.rb'
require 'CSV'
require 'Date'

CSV.foreach("./db/csv/station.csv", :headers => true) do |row|

  city_name = row["city"]
  date = row["installation_date"]

  row['installation_date'] = Date.strptime(date, '%m/%d/%Y')

  city = City.find_or_create_by(name: city_name)

  row.delete("city")
  row.delete("id")

  city.stations.create!(row.to_h)

end

CSV.foreach("./db/csv/weather.csv", :headers => true) do |row|

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
