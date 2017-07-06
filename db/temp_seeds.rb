require 'csv'
require './app/models/station.rb'
require './app/models/city.rb'

City.destroy_all
Station.destroy_all

def from_csv(file_path)
  values = []
  contents = CSV.open(file_path, headers: true, header_converters: :symbol)
  contents.each { |row| values << row.to_h}
  values
end

def seed_city_database(file_path)
  csv = from_csv(file_path)
  cities = csv.each do |row|
    row.keep_if {|key, value| key == :city}
  end
  cities.uniq.each {|city| City.create!(city)}
end

def seed_station_database(file_path)
  stations = from_csv(file_path)
  stations.each do |station|
    city = City.find_by(city: station[:city])
    station.delete_if {|key, value| key == :lat || key == :long || key == :city || key == :id}
    station[:installation_date] = DateTime.strptime(station[:installation_date], "%m/%d/%Y").strftime("%F")
    city.stations.create(station)
  end
end


def seed_trips_database(file_path)

  csv = CSV.open(file_path, headers: true, header_converters: :symbol)

  csv.each_row do |row|

    row.delete_if {|key, value| key == :id}
    new_trip = Trip.create!({duration: row[:duration], start_date: 1, start_station_name: "A", start_station_id: 1, end_date: 2, end_station_name: "B", end_station_id: 2, bike_id: 1, subscription_type: 1, zip_code: 1})

    start_station = Station.find_or_create_by!(name: row[:start_station_name])
      # Some sort of SQL magic here
      start_station.trips << new_trip

    start_date = BikeDate.find_or_create_by!(date: row[:start_date])
      start_date.trips << new_trip

    end_station = Station.find_or_create_by!(name: row[:end_station])
      end_station.trips << new_trip

    end_date = BikeDate.find_or_create_by!(date: row[:end_date])
      end_date.trips << new_trip

    bike = Bike.find_or_create_by!(bike: row[:bike_id])

    subscription = Subscription.find_or_create_by!(name: row[:subscription_type])
      subscription.trips << new_trip

    zip = ZipCode.find_or_create_by!(zip_code: row[:zip_code])
      zip.trips << new_trip

    new_trip.update_attributes(start_date: start_date.id,
                              start_station_name: start_station.name,
                              start_station_id: start_station.id
                              end_date: end_date.id,
                              end_station_name: end_station.name
                              end_station_id: end_station.id,
                              bike_id: bike.id,
                              subscription_type: subscription.id,
                              zip_code: zip.id)
  end
end

seed_city_database("./db/csv/station.csv")
seed_station_database("./db/csv/station.csv")
seed_subscription_database("./db/csv/trip.csv")
seed_dates_database("./db/csv/trip.csv")
seed_trips_database("./db/csv/tiny_trip.csv")
# require 'csv'
# require './app/models/station.rb'
# require './app/models/city.rb'
#
# City.destroy_all
# Station.destroy_all
#
# def from_csv(file_path)
#   values = []
#   contents = CSV.open(file_path, headers: true, header_converters: :symbol)
#   contents.each { |row| values << row.to_h}
#   values
# end
#
# def seed_city_database(file_path)
#   csv = from_csv(file_path)
#   cities = csv.each do |row|
#     row.keep_if {|key, value| key == :city}
#   end
#   cities.uniq.each {|city| City.create!(city)}
# end
#
# def seed_station_database(file_path)
#   stations = from_csv(file_path)
#   stations.each do |station|
#     city = City.find_by(city: station[:city])
#     station.delete_if {|key, value| key == :lat || key == :long || key == :city || key == :id}
#     station[:installation_date] = DateTime.strptime(station[:installation_date], "%m/%d/%Y").strftime("%F")
#     city.stations.create(station)
#   end
# end
#
#
# seed_city_database("./db/csv/station.csv")
# seed_station_database("./db/csv/station.csv")
