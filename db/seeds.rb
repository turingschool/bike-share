require './app/models/station.rb'
require './app/models/city.rb'
require './app/models/trip.rb'
require 'csv'
require 'pry'

City.destroy_all
Station.destroy_all



stations = CSV.open 'db/csv/fixtures/stations_sample_data.csv',
headers: true, header_converters: :symbol

trips = CSV.open 'db/csv/fixtures/trip_sample_data.csv',
headers: true, header_converters: :symbol

stations.each do |row|
  city = City.find_or_create_by!(name: row[:city])
  city.stations.create(id: row[:id],
                 name: row[:name],
                 city_id: city.id,
                 dock_count: row[:dock_count],
                 lat: row[:lat],
                 long: row[:long],
                 installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y')
                 )
  end

  def format_date(date)
    fd = date.split(/[\/: ]/)
    Time.local(fd[2], fd[0], fd[1], fd[3], fd[4])
  end

trips.each do |row|
  Trip.create(id: row[:id],
              duration: row[:duration],
              start_date: format_date(row[:start_date]),
              start_station_id: row[:start_station_id],
              end_date: format_date(row[:end_date]),
              bike_id: row[:bike_id],
              end_station_id: row[:end_station_id],
              subscription_type: row[:subscription_type]
              )
end
