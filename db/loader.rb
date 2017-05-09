require './app/models/city.rb'
require './app/models/station.rb'

require 'CSV'
require 'date'

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
      Station.create(name:         row[:name],
                     dock_count:   row[:dock_count],
                     install_date: Date.strptime(row[:installation_date], "%m/%d/%Y"),
                     city_id:      city.id
                     )
    end
  end

end