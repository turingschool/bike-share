require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/condition.rb'
require './app/models/city.rb'
require 'pry'



@count = 1


Station.destroy_all
open_contents = CSV.open('./db/csv/station.csv', headers: true, header_converters: :symbol)

open_contents.each do |row|
  city = City.find_or_create_by(name: row[:city])
  date = row[:installation_date]
  row[:installation_date] = Date.strptime(date, '%m/%d/%Y')
  Station.create!(name: row[:name],
                  dock_count: row[:dock_count],
                  city_id: city.id,
                  installation_date: row[:installation_date]
                  )
end

Trip.destroy_all

open_contents = CSV.open('./db/fixtures/trip.csv', headers: true, header_converters: :symbol)

open_contents.each do |row|
  @count += 1
  next unless row[:end_date] != ''
  next if row[:zip_code].nil? || row[:zip_code].length < 5

start_date = row[:start_date]
  row[:start_date] = Date.strptime(start_date, '%m/%d/%Y')
end_date = row[:end_date]
  row[:end_date] = Date.strptime(end_date, '%m/%d/%Y')
  Trip.create!(duration: row[:duration],
              start_date: row[:start_date],
              start_station_name: row[:start_station_name],
              start_station_id: row[:start_station_id],
              end_date: row[:end_date],
              end_station_name: row[:end_station_name],
              end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              subscription_type: row[:subscription_type],
              zip_code: row[:zip_code]
              )
      puts "creating trip from row #{@count} with zipcode #{row[:zip_code]} "
end


Condition.destroy_all

open_contents = CSV.open('./db/csv/weather.csv', headers: true, header_converters: :symbol)


open_contents.each do |row|
  next if row[:zip_code] == "94301" && row[:date] == "8/8/15"
  next unless Condition.find_by(date: row[:date]).nil?

  Condition.create!(date: Date.strptime(row[:date],'%m/%d/%Y'),
                  max_temp: row[:max_temperature_f],
                  min_temp: row[:min_temperature_f],
                  mean_temp: row[:mean_temperature_f],
                  mean_humidity: row[:mean_humidity],
                  mean_visibility: row[:mean_visibility_miles],
                  mean_wind_speed: row[:mean_wind_speed_mph],
                  precipitation: row[:precipitation_inches]
                  )
end
