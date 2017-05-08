require 'pry'
require './app/models/city'
require './app/models/station'
require './app/models/date'
require './app/models/weather'
require 'time'
require 'date'
require 'CSV'
total_start_time = Time.now

stations = CSV.open './db/csv/station.csv', headers: true, header_converters: :symbol
puts "seeding stations and cities now!"
start_time = Time.now

stations.each do |row|
  city = City.find_or_create_by(name: row[:city])

  Station.create(name:              row[:name],
                 dock_count:        row[:dock_count],
                 install_date: Date.strptime(row[:installation_date], "%m/%d/%Y"),
                 city_id:           city.id
                 )
end
end_time = Time.now
duration = (end_time - start_time)
puts "stations.csv file upload complete! #{Weather.count} records in #{duration} seconds!"

weathers = CSV.open './db/csv/weather.csv', headers: true, header_converters: :symbol


puts "seeding weathers db now!"

start_time = Time.now

weathers.each do |row|
	zips = {"95113" => City.where(name: "San Jose"),
				  "94301" => City.where(name: "Palo Alto"),
					"94107" => City.where(name: "San Francisco"),
					"94063" => City.where(name: "Redwood City"),
					"94041" => City.where(name: "Mountain View")
				 }
	Weather.create(date:								Date.strptime(row[:date], "%m/%d/%Y" ),
								 maximum_temperature: row[:max_temperature_f],
								 mean_temperature:		row[:mean_temperature_f],
								 minimum_temperature: row[:min_temperature_f],
								 mean_visibility:			row[:mean_visibility_miles],
								 mean_humidity:				row[:mean_humidity],
								 mean_wind_speed:			row[:mean_wind_speed_mph],
								 percipitation:				row[:precipitation_inches],
								 zip_code:						row[:zip_code],
								 city_id:							zips[row[:zip_code]][0].id
								)
end

end_time = Time.now

duration = (end_time - start_time)
puts "weather.csv file upload complete! #{Weather.count} records in #{duration} seconds!"

# put any new seeds above this line
total_end_time = Time.now
total_duration = (total_end_time - total_start_time)
puts "Seed has been completed in #{total_duration} seconds!"
