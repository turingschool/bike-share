require 'CSV'
require './app/models/city.rb'
require './app/models/station.rb'

class Loader

  def initialize(file)
    @data = load_csv(file)
  end

  def load_csv(file)
    CSV.open file, headers: true, header_converters: :symbol
  end

  def load_stations
    @data.each do |row|
      city = City.find_or_create_by(name: row[:city])
      city.stations.create({name: row[:name],
                          dock_count: row[:dock_count],
                          install_date: row[:installation_date]})
    end
  end

end