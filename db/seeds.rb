require './app/models/station.rb'
require './app/models/city.rb'
require 'CSV'

 CSV.foreach("./db/csv/station.csv", :headers => true) do |row|

  city_name = row['city']

  city = City.find_or_create_by(name: city_name)

  row.delete("city")
  row.delete("id")
  city.stations.create!(row.to_h)

end
