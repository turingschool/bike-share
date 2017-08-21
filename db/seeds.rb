require 'csv'
require './app/models/station.rb'
require './app/models/condition.rb'
require './app/models/trip.rb'

Station.destroy_all

Condition.destroy_all

#Trip.destroy_all

#def load_station(data)
  #csv_text = File.read(data)
  #csv = CSV.parse(csv_text, :headers => true)
  #csv.each do |row|
    #s = Station.new
    #s.name = row['name']
    #s.dock_count = row['dock_count']
    #s.city = row['city']
    #s.installation_date = Date.strptime(row['installation_date'], "%m/%d/%Y")
    #s.save!
  #end
#end

#load_station("./db/csv/station.csv")

Condition.copy_from "./db/csv/weather.csv"



