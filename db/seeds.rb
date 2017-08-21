require './app/models/station.rb'
require './app/models/trip.rb'
require './app/models/condition.rb'
require 'csv'
require 'time'
require 'Date'
require 'pry'

def delete_columns(path, column_headers)
  table = CSV.table(path)
  column_headers.each do |column_header|
    table.delete(column_header)
  end
  table
end

def clean_zipcode(zip_code)
  zip_code.to_s.rjust(5, "0")[0..4]
end

def clean_conditions(measurement)
  if measurement.nil?
    measurement = 0.0
  end
  measurement
end

Station.destroy_all
#system 'Say "Good morning Joan, I love you, I will never leave you, destroy stations complete"'
# Trip.destroy_all
# system 'Say "Trips seeded, thank you computer Jesus"'
Condition.destroy_all


stations = delete_columns("./db/csv/station.csv", [:lat, :long])
trips = CSV.foreach "./db/csv/trip.csv", headers: true, header_converters: :symbol
conditions = CSV.foreach "./db/csv/weather.csv", headers: true, header_converters: :symbol

  stations.each do |row|
    row = row.to_h
    row[:installation_date] = Date.strptime(row[:installation_date], '%m/%d/%Y')
    Station.create!(row)
  end

start_time = Time.now
  # count = 0
  # trips.each do |row|
  #   row = row.to_h
  #   row[:start_station_id] = Station.id_by_name(row.delete(:start_station_name))
  #   row[:end_station_id] = Station.id_by_name(row.delete(:end_station_name))
  #   row[:zip_code] = clean_zipcode(row[:zip_code])
  #   row[:start_date] = Date.strptime(row[:start_date], "%m/%d/%Y")
  #   row[:end_date] = Date.strptime(row[:end_date], "%m/%d/%Y")
  #   Trip.create!(row)
  #   count += 1
  #   puts count
  # end

  conditions.each do |row|
    row=row.to_h
    row[:weather_date] = Date.strptime(row[:weather_date], "%m%d%Y")
    row[:max_temperature] = clean_conditions(row.delete(:max_temperature_f))
    row[:mean_temperature] = clean_conditions(row.delete(:mean_temperature_f))
    row[:min_temperature] = clean_conditions(row.delete(:min_temperature_f))
    row[:mean_humidity] = clean_conditions(row.delete(:mean_humidity))
    row[:mean_visibility] = clean_conditions(row.delete(:mean_visibility_miles))
    row[:mean_wind_speed] = clean_conditions(row.delete(:mean_wind_speed_mph))
    row[:precipitation] = clean_conditions(row.delete(:precipitation_inches))
    Condition.create!(row)
  end

puts (Time.now - start_time)
