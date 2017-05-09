require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/zipcode.rb'
require './app/models/condition.rb'
require 'csv'
require 'pry'

Station.destroy_all
City.destroy_all
Condition.destroy_all
Zipcode.destroy_all

def read_csv(file)
  CSV.open(file, headers: true, header_converters: :symbol)
end

stations = read_csv('./db/csv/station.csv')
stations.each do |station|
  city = City.find_or_create_by(name: station[:city])
  Station.create!(name: station[:name],
                dock_count: station[:dock_count],
                city_id: city.id,
                installation_date: Date.strptime(station[:installation_date],'%m/%d/%Y'),
                longitude: station[:long],
                latitude: station[:lat])
end

conditions = read_csv('./db/csv/weather.csv')
conditions.each do |condition|
  elements = [:date,
              :max_temperature_f,
              :mean_temperature_f,
              :min_temperature_f,
              :mean_humidity,
              :mean_visibility_miles,
              :mean_wind_speed_mph,
              :precipitation_inches]

  next unless elements.all? { |element| condition[element] }

  zip = Zipcode.find_or_create_by(zipcode: condition[:zip_code])
  Condition.create(date: Date.strptime(condition[:date],'%m/%d/%Y'),
                    max_temp: condition[:max_temperature_f],
                    mean_temp: condition[:mean_temperature_f],
                    min_temp: condition[:min_temperature_f],
                    mean_humidity: condition[:mean_humidity],
                    mean_visibility: condition[:mean_visibility_miles],
                    mean_wind_speed: condition[:mean_wind_speed_mph],
                    precipitation: condition[:precipitation_inches],
                    zipcode_id: zip.id
                    )
end
