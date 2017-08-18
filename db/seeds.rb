require 'csv'
require './app/models/trip.rb'

csv_file = File.read('db/csv/trip.csv')
csv = CSV.parse(csv_file, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Trip.new
  t.duration = row['duration']
    td = TripDate.new
    td.date = row['start_date']
    td.save
    td.day = row['start_date']
  t.start_date_id = sd.id
  t.start_date = row['start_date']
  t.end_date = row['end_date']
  t.start_station = row['start_station']
  t.end_station = row['end_station']
  t.bike_id = row['bike_id']
  t.subscription_type_id = row['subscription_type_id']
  t.zip_code = ['zip_code']
  t.save
end

puts "There are now #{Trip.count} rows in the trips table"
