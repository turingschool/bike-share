require 'csv'
require './app/models/station'

class Seed

  def self.station
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach('./db/csv/station.csv', options) do |row|
      row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
      row.delete(:long)
      row.delete(:lat)
      Station.create!(row.to_h)
    end
  end

  def self.trip
    #we need to process the date column here. 
  end 

end

Seed.station
