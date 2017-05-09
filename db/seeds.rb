require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/trip.rb'
require './app/models/zipcode.rb'
require 'csv'
require 'pry'

Station.destroy_all
City.destroy_all
Zipcode.destroy_all
Trip.destroy_all

def read_csv(file)
  CSV.open(file, headers: true, header_converters: :symbol)
end

def address_kearny_misspelling(station)
# Change  Kearney/Kearny and convert wrong to right
  if station[:name] == "Washington at Kearney"
    station[:name] = "Washington at Kearny"
  elsif station[:name] == "Post at Kearney"
    station[:name] = "Post at Kearny"
  end
  return station
end

def address_kearny_start_misspelling(trip)
# Change  Kearney/Kearny and convert wrong to right
  if trip[:start_station_name] == "Washington at Kearney"
    trip[:start_station_name] = "Washington at Kearny"
  elsif trip[:start_station_name] == "Post at Kearney"
    trip[:start_station_name] = "Post at Kearny"
  end
  return trip
end

def address_kearny_end_misspelling(trip)
# Change  Kearney/Kearny and convert wrong to right
  if trip[:end_station_name] == "Washington at Kearney"
    trip[:end_station_name] = "Washington at Kearny"
  elsif trip[:end_station_name] == "Post at Kearney"
    trip[:end_station_name] = "Post at Kearny"
  end
  return trip
end

def lookup_start_trips(trip)
# need to change Broadway at Main to Stanford in Redwood City
# need to change San Jose Government Center to Santa Clara County Civic Center
  if trip[:start_station_name] == "Broadway at Main"
    trip[:start_station_name] = "Stanford in Redwood City"
  elsif trip[:start_station_name] == "San Jose Government Center"
    trip[:start_station_name] = "Santa Clara County Civic Center"
  end
  return trip
end

def lookup_end_trips(trip)
# need to change Broadway at Main to Stanford in Redwood City
# need to change San Jose Government Center to Santa Clara County Civic Center
  if trip[:end_station_name] == "Broadway at Main"
    trip[:end_station_name] = "Stanford in Redwood City"
  elsif trip[:end_station_name] == "San Jose Government Center"
    trip[:end_station_name] = "Santa Clara County Civic Center"
  end
  return trip
end

stations = read_csv('./db/csv/station.csv')
stations.each do |station|

  city = City.find_or_create_by(name: station[:city])
  address_kearny_misspelling(station)
  Station.create!(name: station[:name],
                dock_count: station[:dock_count],
                city_id: city.id,
                installation_date: Date.strptime(station[:installation_date],'%m/%d/%Y'),
                longitude: station[:long],
                latitude: station[:lat])
end



trips = read_csv('./db/csv/trip_fixture.csv')
trips.each do |trip|
	zipcode = Zipcode.find_or_create_by(zipcode: trip[:zipcode])

  lookup_start_trips(trip)
  lookup_end_trips(trip)
  address_kearny_start_misspelling(trip)
  address_kearny_end_misspelling(trip)
  
  if trip[:end_station_name] == "Broadway at Main" || trip[:start_station_name] == "Broadway at Main"
    binding.pry
  end
  if trip[:end_station_name] == "San Jose Government Center" || trip[:start_station_name] == "San Jose Government Center"
    binding.pry
  end  
  if trip[:end_station_name] == "Post at Kearney" || trip[:start_station_name] == "Post at Kearney"
    binding.pry
  end
  if trip[:end_station_name] == "Washington at Kearney" || trip[:start_station_name] == "Washington at Kearney"
    binding.pry
  end

  start_station = Station.find_by(name: trip[:start_station_name])
  end_station = Station.find_by(name: trip[:end_station_name])

  #next if start_station.nil? || end_station.nil?
  Trip.create!(
              duration: trip[:duration],
              start_date: DateTime.strptime(trip[:start_date],'%m/%d/%Y %H:%M'),
              start_station_id: start_station.id,
              end_date: DateTime.strptime(trip[:end_date],'%m/%d/%Y %H:%M'),
              end_station_id: end_station.id,
              bike_id: trip[:bike_id],
              subscription_type: trip[:subscription_type],
              zipcode_id: zipcode.id
  )
end