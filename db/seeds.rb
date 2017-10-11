require 'csv'
require './app/models/station'
require './app/models/condition'
require './app/models/trip'

class Seed

  def self.station
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/station.csv', options) do |row|
      row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
      row[:station_id] = row[:id]
      row.delete(:id)
      row.delete(:long)
      row.delete(:lat)
      Station.create!(row.to_h)
    end
  end

  def self.condition
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/weather.csv', options) do |row|
      next if row[:zip_code] != 94107
      row[:date] = Date.strptime(row[:date], "%m/%d/%Y")
      row.delete(:max_dew_point_f)
      row.delete(:mean_dew_point_f)
      row.delete(:min_dew_point_f)
      row.delete(:max_humidity)
      row.delete(:min_humidity)
      row.delete(:max_sea_level_pressure_inches)
      row.delete(:mean_sea_level_pressure_inches)
      row.delete(:min_sea_level_pressure_inches)
      row.delete(:max_visibility_miles)
      row.delete(:min_visibility_miles)
      row.delete(:wind_dir_degrees)
      row.delete(:max_wind_speed_mph)
      row.delete(:max_gust_speed_mph)
      row.delete(:cloud_cover)
      row.delete(:events)
      Condition.create!(row.to_h)
    end
  end

  def self.trip
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/trip.csv', options) do |row|
      row = row.to_h
      row[:start_date] = row[:start_date].split(" ").first
      row[:start_date] = Date.strptime(row[:start_date], "%m/%d/%Y")
      row[:end_date] = row[:end_date].split(' ').first
      row[:end_date] = Date.strptime(row[:end_date], "%m/%d/%Y")
      row.delete(:id)
      row.delete(:zip_code) if row[:zip_code].to_s.length > 5
      Trip.create!(row.to_h)
    end
  end
end


Seed.station
Seed.trip
Seed.condition
