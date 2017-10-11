require 'csv'
require './app/models/station'
require './app/models/trip'
require './app/models/condition'

class Seed

  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    seed_stations
    seed_conditions
    seed_trips
  end

  def self.seed_stations
    CSV.foreach("./db/csv/station.csv", OPTIONS) do |row|
      row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
      Station.create!(row.to_hash)
    end
  end


  def self.seed_trips
    CSV.foreach("./db/csv/trip.csv", OPTIONS) do |row|
      row[:start_date] = DateTime.strptime(row[:start_date], "%m/%d/%Y %H:%M")
      row[:end_date] = DateTime.strptime(row[:end_date], "%m/%d/%Y %H:%M")
      Trip.create!(row.to_hash)
    end
  end
  
  def self.seed_conditions
    CSV.foreach("./db/csv/weather.csv", OPTIONS) do |row|
      next if row[:zip_code] != "94107"
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
      row.delete(:max_wind_speed_mph)
      row.delete(:max_gust_speed_mph)
      row.delete(:cloud_cover)
      row.delete(:events)
      row.delete(:wind_dir_degrees)
      condition = Condition.create!(row.to_hash)
    end
  end
end

Seed.start
