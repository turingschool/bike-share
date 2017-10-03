require 'csv'
require './app/models/station'

class Seed

  def self.start
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach("./db/csv/station.csv", options ) do |row|
        row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
        Station.create!(row.to_hash)
    end
  end

end

Seed.start
