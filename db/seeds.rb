require './app/models/trip'
require './app/models/station'
require './app/models/condition'
require './app/models/status'
require 'csv'
require 'pry'

a = Time.now
puts "Starting seeding..."
# system "rake db:drop"
# system "rake db:create"
# system "rake db:migrate"

trips = Trip.convert_csv_to_trip_attributes
Trip.import trips

stations = Station.convert_csv_to_station_attributes
Station.import stations

conditions = Condition.convert_csv_to_condition_attributes
Condition.import conditions

# statuses = Status.convert_csv_to_status_attributes
# Status.import statuses

b = Time.now
puts "Seeding took #{((b - a).to_f / 60).round(2)} minutes"
