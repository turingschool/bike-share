require './app/models/station.rb'
require './app/models/city.rb'
require 'CSV'
require 'Date'

 CSV.foreach("./db/csv/station.csv", :headers => true) do |row|

  city_name = row["city"]
  date = row["installation_date"]


  row['installation_date'] = Date.strptime(date, '%m/%d/%Y')


  city = City.find_or_create_by(name: city_name)

  row.delete("city")
  row.delete("id")
  city.stations.create!(row.to_h)


end
