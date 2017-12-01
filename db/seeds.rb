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

end

Station.destroy_all
Seed.station
