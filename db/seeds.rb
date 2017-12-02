require 'csv'
require 'pry'
require './app/models/station'

class Seed

  def self.station
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/station.csv', options) do |row|
      Station.create(installation_date: Date.strptime(row[:installation_date], "%m/%d/%Y"),
      name: row[:name],
      city: row[:city],
      dock_count: row[:dock_count])
    end
  end

  def self.trip
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/trip.csv', options) do |row|
      Trip.create(
        duration: row[:duration],
        start_date: Date.strptime(row[:start_date]),
        start_station_name: row[:start_station_name],
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date]),
        end_station_name: row[:end_station_name],
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zip_code: clean_zipcode(row[:zip_code]))
    end
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4].to_i
  end

end

Station.destroy_all
Seed.station
