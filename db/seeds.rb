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

    CSV.foreach("./db/csv/trip.csv", options ) do |row|
      next if Trip.exists?(row[:id])
      convert_date(row, :start_date)
      convert_date(row, :end_date)
      row.delete(:start_station_name)
      row.delete(:end_station_name)
      Trip.create(row.to_hash)
    end

  end

  def self.convert_date(row, field)
    m, d, y = row[field].split('/')
    row[field] = [d, m, y].join('/')
  end

end

Seed.start
