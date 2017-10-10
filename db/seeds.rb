require 'csv'
require './app/models/station'
require './app/models/trip'

class Seed

  def self.start
    options = {headers: true, header_converters: :symbol, converters: :numeric}

    CSV.foreach("./db/csv/station.csv", options ) do |row|
      next if Station.exists?(row[:id])
      convert_date(row, :installation_date)
      Station.create!(row.to_hash)
    end

    CSV.foreach("./db/csv/trip_fixture.csv", options ) do |row|
      next if Trip.exists?(row[:id])
      convert_date(row, :start_date)
      convert_date(row, :end_date)
      row.delete(:start_station_name)
      row.delete(:end_station_name)
      Trip.create(row.to_hash)
    end

    CSV.foreach("./db/csv/weather.csv", options ) do |row|
      next if Condition.exists?(row[:id])
      convert_date(row, :date)
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
      row.delete(:max_wind_Speed_mph)
      row.delete(:max_gust_speed_mph)
      row.delete(:cloud_cover)
      row.delete(:events)
      row.delete(:wind_dir_degrees)
      row.delete(:zip_code)

      Condition.create!(row.to_hash)
    end

  end

  def self.convert_date(row, field)
    m, d, y = row[field].split('/')
    row[field] = [d, m, y].join('/')
  end

end

Seed.start
