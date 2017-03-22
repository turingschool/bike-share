require 'csv'
require './app/models/station.rb'
require './app/models/trip.rb'
require 'pry'


Station.destroy_all
open_contents = CSV.open('./db/csv/station.csv', headers: true, header_converters: :symbol)


open_contents.each do |row|
  date = row[:installation_date]
  row[:installation_date] = Date.strptime(date, '%m/%d/%Y')
  Station.create!(name: row[:name],
                  dock_count: row[:dock_count],
                  city: row[:city], 
                  installation_date: row[:installation_date]
                  )
end

Trip.destroy_all
open_contents = CSV.open('./db/fixtures/trip.csv', headers: true, header_converters: :symbol)

open_contents.each do |row|

start_date = row[:start_date]
  row[:start_date] = Date.strptime(start_date, '%m/%d/%Y')

end_date = row[:end_date]
  row[:end_date] = Date.strptime(end_date, '%m/%d/%Y') 
  Trip.create!(duration: row[:duration],
              start_date: row[:start_date],
              start_station_name: row[:start_station_name], 
              start_station_id: row[:start_station_id],
              end_date: row[:end_date],
              end_station_name: row[:end_station_name],
              end_station_id: row[:end_station_id],
              bike_id: row[:bike_id],
              subscription_type: row[:subscription_type],
              zip_code: row[:zip_code]
              )
end