require 'csv'
require './app/models/station'

class Seed

  def self.start
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach("./db/csv/station.csv", options ) do |row|
      m, d, y = row[:installation_date].split('/')
      row[:installation_date] = [d, m, y].join('/')
      
      Station.create!(row.to_hash)
    end
  end

end

Seed.start
