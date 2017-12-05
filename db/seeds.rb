require 'csv'
require 'pry'
require './app/models/station'
require './app/models/trip'
require './app/models/condition'

class Seed

  def self.station
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/station.csv', options) do |row|
      Station.create(id: row[:id],
      installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"),
      name: row[:name],
      city: row[:city],
      dock_count: row[:dock_count])
    end
  end

  def self.trip
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/trip_fixture.csv', options) do |row|
      Trip.create(
        duration: row[:duration],
        start_date: Date.strptime(row[:start_date], "%m/%d/%Y"),
        start_station_name: row[:start_station_name],
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], "%m/%d/%Y"),
        end_station_name: row[:end_station_name],
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zip_code: (row[:zip_code]).to_s.rjust(5,"0")[0..4].to_i)
    end
  end

  def self.condition
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/weather.csv', options) do |row|
      if row[:zip_code] == 94107
        Condition.create(date:           Date.strptime(row[:date], '%m/%d/%Y'),
                       mean_temperature_f: row[:mean_temperature_f],
                       max_temperature_f:  row[:max_temperature_f],
                       min_temperature_f:  row[:min_temperature_f],
                       mean_humidity:    row[:mean_humidity],
                       mean_visibility_miles:  row[:mean_visibility_miles],
                       mean_wind_speed_mph:  row[:mean_wind_speed_mph],
                       precipitation_inches:    row[:precipitation_inches],
                       zip_code: (row[:zip_code]).to_s.rjust(5,"0")[0..4].to_i)
      end
    end
  end
end

Station.destroy_all
Seed.station
Trip.destroy_all
Seed.trip
Condition.destroy_all
Seed.condition
