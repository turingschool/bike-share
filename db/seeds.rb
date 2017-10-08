require 'csv'
require './app/models/station'
require './app/models/trip'

class Seed

  def self.station
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/station.csv', options) do |row|
      row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
      row.delete(:id)
      row.delete(:long)
      row.delete(:lat)
      Station.create!(row.to_h)
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
      row.delete(:start_station_id)
      row.delete(:end_station_id)
      row.delete(:zip_code) if row[:zip_code].to_s.length > 5
			Trip.create!(row.to_h) 
	  end 
	end 
end

Seed.station
Seed.trip
