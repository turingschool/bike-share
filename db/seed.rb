require './app/models/station'
require './app/models/city'
require 'csv'

contents = CSV.open("./csv/station.csv", headers: true, header_converters: symbol)

contents.each do |row|

  city = City.find_or_create_by(row[:city])

  Station.create(name: row[:name],
                 dock_count: row[:dock_count],
                 city: row[:city],
                 installation_date: Date.strptime(row[:installation_date]),
                 city_id: city.id 
                 )

end
