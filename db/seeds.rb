require './app/models/trip'
require './app/models/station'
require './app/models/condition'
require 'csv'
require 'pry'

a = Time.now
puts "Starting seeding..."
# system "rake db:drop"
# system "rake db:create"
# system "rake db:migrate"

CSV.foreach('db/csv/trip_fixture.csv', {headers: true, header_converters: :symbol}) do |row|
  next if row[:zip_code].to_s.length != 5
  Trip.create(duration:            row[:duration],
              start_date:          Date.strptime(row[:start_date], '%m/%e/%Y')),
              start_station_name:  row[:start_station_name],
              start_station_id:    row[:start_station_id],
              end_date:            Date.strptime(row[:end_date], '%m/%e/%Y')),
              end_station_name:    row[:end_station_name],
              end_station_id:      row[:end_station_id],
              bike_id:             row[:bike_id],
              subscription_type:   row[:subscription_type],
              zip_code:            row[:zip_code])

end

CSV.foreach('db/csv/station.csv', {headers: true, header_converters: :symbol}) do |row|
  Station.create(name:              row[:name],
                 lat:               row[:lat],
                 long:              row[:long],
                 dock_count:        row[:dock_count],
                 city:              row[:city],
                 installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y'))
end

CSV.foreach('db/csv/weather.csv', {headers: true, header_converters: :symbol}) do |row|
  Condition.create(
   date:                           Date.strptime(row[:date], '%m/%e/%Y')),
   max_temperature_f:              row[:max_temperature_f],
   mean_temperature_f:             row[:mean_temperature_f],
   min_temperature_f:              row[:min_temperature_f],
   mean_humidity:                  row[:mean_humidity],
   mean_visibility_miles:          row[:mean_visibility_miles],
   mean_wind_speed_mph:            row[:mean_wind_speed_mph],
   precipitation_inches:           row[:precipitation_inches]
   )
end

# CSV.foreach('db/csv/status.csv', {headers: true, header_converters: :symbol}) do |row|
#   Status.create(
#   station_id:      row[:station_id]
#   bikes_available: row[:bikes_available]
#   docks_available: row[:docks_available]
#   time:            row[:time]
#   )
# end

b = Time.now
puts "Seeding took #{((b - a).to_f / 60).round(2)} minutes"
