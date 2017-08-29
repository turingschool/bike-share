require 'ccsv'
require 'CSV'
require 'pry'
require './app/models/trip'
require './app/models/subscription_type'
require './app/models/zip_code'
require './app/models/city'
require './app/models/station'
require './app/models/weather'

def compute_subscription_id(subscription_string)
  if subscription_string[0] == "S"
    1
  else
    2
  end
end

def get_date(date)
  Date.strptime(date.split(" ")[0], "%m/%d/%Y")
end

header = true

Trip.destroy_all
ZipCode.destroy_all
SubscriptionType.destroy_all
Weather.destroy_all

SubscriptionType.create(id: 1, subscription_type: 'Subscriber')
SubscriptionType.create(id: 2, subscription_type: 'Customer')

CSV.foreach('./db/csv/station.csv', :headers => true, :encoding => 'ISO-8859-1') do |row|

  city = City.find_or_create_by(city: row["city"])

  name = "Stanford in Redwood City" if name == "Broadway at Main"
  name = "Santa Clara County Civic Center" if name == "San Jose Government Center"
  name = "Post at Kearney" if name == "Post at Kearny"
  name = "Washington at Kearney" if name == "Washington at Kearny"

  Station.create(name: row["name"],
                 dock_count: row["dock_count"],
                 installation_date: Date.strptime(row["installation_date"], "%m/%d/%Y"),
                 city_id: city.id,
                 lat: row["lat"],
                 long: row["long"]
                 )
  end

  puts "There are now #{Station.count} rows in the stations table."


header = true
Ccsv.foreach('db/csv/trip.csv') do |row|
  if header == false && row[0].to_i < 200000
      start_station = Station.find_or_create_by(name: row[3])
      end_station = Station.find_or_create_by(name: row[6])
    trip = Trip.new(duration: row[1],
                    start_station: start_station.id,
                    end_station: end_station.id,
                    bike_id: row[8],
                    trip_date: get_date(row[2])
                    )

      trip.subscription_type = SubscriptionType.find(compute_subscription_id(row[9]))
      trip.zip_code = ZipCode.find_or_create_by(zip_code: row[10])
      trip.save

      puts "Adding trip #{row[0]} to the table"

  end
  header = false

end

puts "There are now #{Trip.count} rows in the trips table"

header = true
Ccsv.foreach('db/csv/weather.csv') do |row|
  if header == false && row[23] == "94107"

    weather = Weather.create(date: get_date(row[0]),
                            max_temperature: row[1].to_f,
                            mean_temperature: row[2].to_f,
                            min_temperature: row[3].to_f,
                            mean_humidity: row[8].to_f,
                            mean_visibility: row[14].to_f,
                            mean_wind_speed: row[17].to_f,
                            precipitation: row[19].to_f
                    )

                    puts "Adding weather #{weather.id} to the table"

  end
  header = false

end

puts "There are now #{Weather.count} rows in the weather table"
