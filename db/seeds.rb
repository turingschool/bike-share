require_relative "./../app/models/city"
require_relative "./../app/models/station"
require_relative "./../app/models/trip"
require 'csv'
require 'smarter_csv'

# if shit gets real => rake db:drop 
#                      rake db:create 
#                      rake db:migrate 
#                      rake db:seed

CSV.foreach('./db/csv/station.csv', headers: true, header_converters: :symbol) do |row|
    new_city          = City.find_or_create_by(name: row[:city])
    installation_date = Date.strptime(row[:installation_date], "%m/%d/%Y")

    Station.create(name:              row[:name],
                   lat:               row[:lat],
                   lng:               row[:long],
                   dock_count:        row[:dock_count],
                   city_id:           new_city.id,
                   installation_date: installation_date)
end

SmarterCSV.process('db/csv/trip.csv').each do |row|
  # require 'pry'; binding.pry
  start_time = row[:start_date].split(' ')[-1]
  start_date = Date.strptime(row[:start_date], "%m/%d/%Y")
  end_date   = Date.strptime(row[:end_date], "%m/%d/%Y")
  end_time   = row[:end_date].split(' ')[-1]

  Trip.create(duration:          row[:duration],
              start_date:        start_date,
              start_time:        start_time,
              start_station_id:  row[:start_station_id],
              end_date:          end_date,
              end_time:          end_time,
              end_station_id:    row[:end_station_id],
              bike_id:           row[:bike_id],
              subscription_type: row[:subscription_type],
              zip_code:          row[:zip_code])
end

# TRIPS DATA LOOKS LIKE SUCH 
# { :id                 => 4576,
#   :duration           => 63,
#   :start_date         => "8/29/2013 14:13",
#   :start_station_name => "South Van Ness at Market",
#   :start_station_id   => 66,
#   :end_date           => "8/29/2013 14:14",
#   :end_station_name   => "South Van Ness at Market",
#   :end_station_id     => 66,
#   :bike_id            => 520,
#   :subscription_type  => "Subscriber",
#   :zip_code           => 94127 }