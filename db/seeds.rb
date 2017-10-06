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
      row.delete(:id)
      row.delete(:start_station_id)
      row.delete(:end_station_id)
      #need to create a buffer for huge zip codes 
      row.delete(:zip_code) if row[:zip_code].to_s.length > 5
			Trip.create!(row.to_h) 
	  end 
	end 
end

Seed.station
Seed.trip
