require 'csv'
require 'pry'
require 'date'
require './app/models/station'
require './app/models/city'
require './app/models/subscription'
require './app/models/trip'
require './app/models/weather'

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
    row.delete_if { |k,v| k == :lat || k == :long || k == :city || k == :id}
    row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
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
    row[:weather_id] = Weather.find_by(date: row[:start_date]).id if Weather.find_by(date: row[:start_date])
    row[:start_station_name] = "Stanford in Redwood City" if row[:start_station_name] == "Broadway at Main"
    row[:end_station_name] = "Stanford in Redwood City" if row[:end_station_name] == "Broadway at Main"
    row[:start_station_name] = "Santa Clara County Civic Center" if row[:start_station_name] == "San Jose Government Center"
    row[:end_station_name] = "Santa Clara County Civic Center" if row[:end_station_name] == "San Jose Government Center"
    row[:start_station_name] = "Post at Kearney" if row[:start_station_name] == "Post at Kearny"
    row[:end_station_name] = "Post at Kearney" if row[:end_station_name] == "Post at Kearny"
    row[:start_station_name] = "Washington at Kearney" if row[:start_station_name] == "Washington at Kearny"
    row[:end_station_name] = "Washington at Kearney" if row[:end_station_name] == "Washington at Kearny"
    row[:start_station_id] = Station.find_by(name: row[:start_station_name]).id
    row[:end_station_id] = Station.find_by(name: row[:end_station_name]).id
    subscription = Subscription.find_by(subscription_type: row[:subscription_type])
    row.delete_if {|k,v| k == :subscription_type || k == :start_station_name || k == :end_station_name || k == :id}
    subscription.trips.create!(row)
  end
end

def seed_weather_database(file_path)
  weathers = from_csv(file_path)
  weathers.each do |row|
    row.keys.each do |k, v|
      row[k.to_s.chomp("_f").to_sym] = row[k] if k.to_s.include?("_f")
      row[k.to_s.chomp("_mph").to_sym] = row[k] if k.to_s.include?("_mph")
      row[k.to_s.chomp("_inches").to_sym] = row[k] if k.to_s.include?("_inches")
      row[k.to_s.chomp("_miles").to_sym] = row[k] if k.to_s.include?("_miles")
    end
    row.keep_if {|k,v|  k == :date || k == :max_temperature ||
                        k == :mean_temperature || k == :min_temperature ||
                        k == :mean_humidity || k == :mean_visibility ||
                        k == :mean_wind_speed || k == :precipitation}
    row[:date] = Date.strptime(row[:date], "%m/%d/%Y")
    Weather.create!(row)
  end
end

# seed_city_database("db/csv/station.csv")
seed_weather_database("db/csv/weather.csv")
# seed_station_database("db/csv/station.csv")
# seed_subscriptions_database("db/csv/trip.csv")
# seed_trips_database("db/csv/trip.csv")

# #fixtures:
# seed_city_database("db/fixtures/stations.csv")
# seed_weather_database("db/fixtures/weather.csv")
# seed_station_database("db/fixtures/stations.csv")
# seed_subscriptions_database("db/fixtures/trips.csv")
# seed_trips_database("db/fixtures/trips.csv")
