require 'csv'
require './app/models/station'

class Seed

  def self.start
    options = {headers: true, header_converters: :symbol, converters: :numeric}
    CSV.foreach("./db/csv/station.csv", options ) do |row|
        # m, d, y = row[:installation_date].split('/')
        # row[:installation_date] = [d, m, y].join('/')

        # row[:installation_date] = Date.parse Date.strptime(row[:installation_date], "%m/%d/%Y").to_s

        # row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
        Station.create!(row.to_hash)
    end
  end

end

Seed.start
