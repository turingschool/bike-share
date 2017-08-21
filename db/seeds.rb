require './app/models/station'
require './app/models/city'
require 'CSV'
require 'pry'

CSV.foreach('./db/csv/station.csv', :headers => true, :encoding => 'ISO-8859-1') do |row|
  city = City.find_or_create_by(city: row["city"])

  Station.create(name: row["name"],
                 dock_count: row["dock_count"],
                 installation_date: Date.strptime(row["installation_date"], "%m/%d/%Y"),
                 city_id: city.id
                 )
end