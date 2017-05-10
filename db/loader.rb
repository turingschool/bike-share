require './app/models/city.rb'
require './app/models/station.rb'
require './app/models/condition.rb'

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

  def load_conditions
    Loader.new('./db/csv/station.csv').load_stations
    @data.each do |row|
      zips = {"95113" => City.where(name: "San Jose"),
              "94301" => City.where(name: "Palo Alto"),
              "94107" => City.where(name: "San Francisco"),
              "94063" => City.where(name: "Redwood City"),
              "94041" => City.where(name: "Mountain View")
             }
      Condition.create(date:                Date.strptime(row[:date], "%m/%d/%Y" ),
                     maximum_temperature: row[:max_temperature_f],
                     mean_temperature:    row[:mean_temperature_f],
                     minimum_temperature: row[:min_temperature_f],
                     mean_visibility:     row[:mean_visibility_miles],
                     mean_humidity:       row[:mean_humidity],
                     mean_wind_speed:     row[:mean_wind_speed_mph],
                     percipitation:       row[:precipitation_inches],
                     zip_code:            row[:zip_code],
                     city_id:             zips[row[:zip_code]][0].id
                    )
      end
  end
end
