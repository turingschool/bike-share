require 'ccsv'
require './app/modles/station'
require './app/models/trip'

header = true
Ccsv.foreach('/csv/trip') do |row|
  while header == false
    trip = Trip.new(duration: row[1],
                    start_date: row[2],
                    end_date: row[3],
                    start_station: row[4],
                    end_station: row[5],
                    bike_id: row[6],
                    subscription_type_id: row[7],
                    zip_code: row[8])
    trip.save
  end
  header = false
end

header = true
Ccsv.foreach('/csv/station') do |row|
  while header == false
    station = Station.new(name: row[1],
                          lat: row[2],
                          long: row[3],
                          dock_count: = row[4],
                          city: row[5],
                          installation_date: row[6])
    station.save
  end
  header = false
end
