require 'csv'
require 'pry'
require 'date'
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
  cities = csv.each do |row|
    row.keep_if {|k,v| k == :city}
  end
  cities.uniq.each {|city| City.create!(city)}
end

def seed_station_database(file_path)
  stations = from_csv(file_path)
  stations.each do |row|
    city = City.find_by(city: row[:city])
    row.delete_if { |k,v| k == :lat || k == :long || k == :city}
    city.stations.create!(row)
  end
end



def seed_subscriptions_database(file_path)
  subscriptions = from_csv(file_path)
  subscriptions.each do |row|
    row.keep_if {|k,v| k == :subscription_type}
  end
  subscriptions.uniq.each {|sub_type| Subscription.create!(sub_type)}
end

def seed_trips_database(file_path)
  trips = from_csv(file_path)
  trips.each do |row|
    next if row[:zip_code] == '' || row[:zip_code] == nil
    row[:start_date] = DateTime.strptime(row[:start_date], "%m/%d/%Y %H:%M")
    row[:end_date] = DateTime.strptime(row[:end_date], "%m/%d/%Y %H:%M")
    subscription = Subscription.find_by(subscription_type: row[:subscription_type])
    row.delete_if {|k,v| k == :subscription_type || k == :start_station_name || k == :end_station_name || k == :id}
    subscription.trips.create!(row)
  end
end


# seed_city_database("db/csv/station.csv")
# seed_station_database("db/csv/station.csv")
# seed_subscriptions_database("db/csv/trip.csv")
# seed_trips_database("db/csv/trip.csv")
