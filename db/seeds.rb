require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/trip.rb'
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

start_date = DateTime.strptime('8/29/2013 14:01', '%m/%d/%Y %k:%M')
end_date = DateTime.strptime('8/29/2013 14:23', '%m/%d/%Y %k:%M')

31.times do |i|
  Station.create!(lat: 37.329732, long: -121.90178200000001, name: "Start Dummy \##{i + 1}", dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
  Station.create!(lat: 37.329732, long: -121.90178200000001, name: "End Dummy \##{i + 1}", dock_count: 12, city_id: 1, installation_date: Date.parse('8/6/2013'))
  Trip.create!(duration: 22, start_date: start_date, end_date: end_date, subscription_type: 'subscriber', bike_id: 1, start_station_id: (i * 2) + 1, end_station_id: (i + 1) * 2, weather_id: 1)
end
