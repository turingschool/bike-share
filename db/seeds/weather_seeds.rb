require_relative '../../app/models/weather'

Weather.destroy_all

weather_text = File.read('./db/csv/weather.csv')
weather_csv = CSV.parse(weather_text, :headers => true, header_converters: :symbol)
weather_csv.each do |row|
  Weather.transaction do
    date = BikeShareDate.find_or_initialize_by(bike_share_date: row[:date])
    max_temp = row[:max_temperature_f]
    mean_temp = row[:mean_temperature_f]
    min_temp = row[:min_temperature_f]
    max_dew_point_f = row[:max_dew_point_f]
    mean_dew_point_f = row[:mean_dew_point_f]
    min_dew_point_f = row[:min_dew_point_f]
    max_humidity = row[:max_humidity]
    mean_humidity = row[:mean_humidity]
    min_humidity = row[:min_humidity]
    max_sea_level_pressure_inches = row[:max_sea_level_pressure_inches]
    mean_sea_level_pressure_inches = row[:mean_sea_level_pressure_inches]
    min_sea_level_pressure_inches = row[:min_sea_level_pressure_inches]
    max_visibility_miles = row[:max_visibility_miles]
    mean_visibility_miles = row[:mean_visibility_miles]
    min_visibility_miles = row[:min_visibility_miles]
    max_wind_speed_mph = row[:max_wind_speed_mph]
    mean_wind_speed_mph = row[:mean_wind_speed_mph]
    max_gust_speed_mph = row[:max_gust_speed_mph]
    precipitation_inches = row[:precipitation_inches]
    cloud_cover = row[:cloud_cover]
    events = row[:events]
    wind_dir_degrees = row[:wind_dir_degrees]
    zip_code = ZipCode.find_or_initialize_by(zip_code: row[:zip_code])

    Weather.create!(bike_share_date: date,
                    max_temperature_f: max_temp,
                    mean_temperature_f: mean_temp,
                    min_temperature_f: min_temp,
                    max_dew_point_f: max_dew_point_f,
                    mean_dew_point_f: mean_dew_point_f,
                    min_dew_point_f: min_dew_point_f,
                    max_humidity: max_humidity,
                    mean_humidity: mean_humidity,
                    min_humidity: min_humidity,
                    max_sea_level_pressure_inches: max_sea_level_pressure_inches,
                    mean_sea_level_pressure_inches: mean_sea_level_pressure_inches,
                    min_sea_level_pressure_inches: min_sea_level_pressure_inches,
                    max_visibility_miles: max_visibility_miles,
                    mean_visibility_miles: mean_visibility_miles,
                    min_visibility_miles: min_visibility_miles,
                    max_wind_speed_mph: max_wind_speed_mph,
                    mean_wind_speed_mph: mean_wind_speed_mph,
                    max_gust_speed_mph: max_gust_speed_mph,
                    precipitation_inches: precipitation_inches,
                    cloud_cover: cloud_cover,
                    events: events,
                    wind_dir_degrees: wind_dir_degrees,
                    zip_code: zip_code
                    )
                  end
 end
