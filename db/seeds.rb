require './app/models/city.rb'
require './app/models/station.rb'
require 'csv'

City.destroy_all
Station.destroy_all

station_text = File.read('./db/csv/station.csv')
station = CSV.parse(station_text, :headers => true, header_converters: :symbol)
station.each do |row|
  date_elements = row[:installation_date].split("/")
  formatted_date = date_elements[2] + "-" + date_elements[0] + "-" + date_elements[1]

  city = City.find_or_create_by!(name: row[:city])
  city.stations.create!(name: row[:name], dock_count: row[:dock_count], installation_date: formatted_date)
end

