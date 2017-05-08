require './app/models/city.rb'
require './app/models/station.rb'
require './app/models/start_station.rb'
require './app/models/end_station.rb'
require './app/models/subscription_type.rb'
require './app/models/trip.rb'
require 'csv'

City.destroy_all
Station.destroy_all

def format_date(unformatted_date)
  date_elements = unformatted_date.split("/")
  formatted_date = date_elements[2] + "-" + date_elements[0] + "-" + date_elements[1]
end

def format_zip_code(zipcode)
  return nil if zipcode.nil?
  return nil if zipcode.to_s.length < 5
  zipcode.to_s[0..4].to_i
end

def clean_station(station_input)
  if station_input == "San Jose Government Center"
    clean_station_name = "Santa Clara County Civic Center"
  else 
    clean_station_name = station_input
  end
  station_input
end

station_text = File.read('./db/csv/station.csv')
station = CSV.parse(station_text, :headers => true, header_converters: :symbol)
station.each do |row|
  city = City.find_or_create_by!(name: row[:city])
  station = city.stations.create!(name: row[:name],
                                  dock_count: row[:dock_count],
                                  installation_date: format_date(row[:installation_date]))
  StartStation.create(station_id: station.id)
  EndStation.create(station_id: station.id)
end

trip_text = File.read('./db/csv/trip.csv')
trip = CSV.parse(trip_text, :headers => true, header_converters: :symbol)
trip.each do |row|
  next if row[:start_station_name].nil? || row[:end_station_name].nil?
  start_station = Station.find_by(name: clean_station(row[:start_station_name])).start_station.id
  end_station = Station.find_by(name: clean_station(row[:end_station_name])).end_station.id
  next if start_station.nil? || end_station.nil?
  subscription = SubscriptionType.find_or_create_by!(name: row[:subscription_type])
  subscription.trips.create!(duration: row[:duration],
                            start_station_id: start_station
                            end_station_id: end_station
                            start_date: format_date(row[:start_date].split.first),
                            end_date: format_date(row[:end_date].split.first),
                            bike_id: row[:bike_id],
                            zip_code: format_zip_code(row[:zip_code]))
end

