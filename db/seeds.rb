require 'CSV'
require './app/models/city.rb'

stations = CSV.open './db/csv/station.csv', headers: true, header_converters: :symbol

binding.pry
stations.each do |row|
  city = City.find_or_create_by(name: row[:city])

end

