require 'csv'
require 'pry'
require './app/models/station'
require './app/models/city'
require './app/models/subscription'
require './app/models/trip'

def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each {|row| values << row.to_h }
  values
end

def seed_city_database(file_path)
  csv = from_csv(file_path)
  cities = csv.each do |city|
    city.keep_if {|k,v| k == :city}
  end
  cities.uniq.each {|city| City.create!(city)}
end

def seed_station_database(file_path)
  stations = from_csv(file_path)
  stations.each do |station|
    city = City.find_by(city: station[:city])
    station.delete_if { |k,v| k == :lat || k == :long || k == :city}
    city.stations.create!(station)
  end
end

def seed_subscriptions_database(file_path)
  subscriptions = from_csv(file_path)
  subscriptions.each do |subscription_type|
    subscription_type.keep_if {|k,v| k == :subscription_type}
  end
  subscriptions.uniq.each {|sub_type| Subscription.create!(sub_type)}
end

def seed_trips_database(file_path)
  trips = from_csv(file_path)
  trips.each do |trip|
    subscription = Subscription.find_by(subscription_type: trip[:subscription_type])
    trip.delete_if {|k,v| k == :subscription_type || k == :start_station_name || k == :end_station_name}
    next if trip[:zip_code] == '' || trip[:zip_code] == nil
    subscription.trips.create!(trip)
  end
end

# seed_city_database("db/csv/station.csv")
# seed_station_database("db/csv/station.csv")
# seed_subscriptions_database("db/csv/trip.csv")
seed_trips_database("db/csv/trip.csv")
