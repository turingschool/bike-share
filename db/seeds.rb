require 'ccsv'
require 'CSV'
require 'pry'
require './app/models/trip'
require './app/models/subscription_type'
require './app/models/start_date'
require './app/models/end_date'
require './app/models/zip_code'
require './app/models/city'
require './app/models/station'

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
StartDate.destroy_all
EndDate.destroy_all
ZipCode.destroy_all
SubscriptionType.destroy_all
Weather.destroy_all

SubscriptionType.create(subscription_type: 'Subscriber')
SubscriptionType.create(subscription_type: 'Customer')

header = true
Ccsv.foreach('db/csv/trip.csv') do |row|
  if header == false && row[0].to_i < 6000
    start_date = StartDate.find_or_create_by(date: get_date(row[2]))
    end_date = EndDate.find_or_create_by(date: get_date(row[5]))

    trip = Trip.new(duration: row[1],
                    start_station: row[4],
                    end_station: row[7],
                    bike_id: row[8],
                    start_date_id: start_date.id,
                    end_date_id: end_date.id
                    )
      trip.subscription_type = SubscriptionType.find(compute_subscription_id(row[9]))
      trip.zip_code = ZipCode.find_or_create_by(zip_code: row[10])
      trip.save

      puts "Adding trip #{row[0]} to the table"
  end
  header = false
end

puts "There are now #{Trip.count} rows in the trips table"

CSV.foreach('./db/csv/station.csv', :headers => true, :encoding => 'ISO-8859-1') do |row|
  #We may need to review this portion of the code. How does this join the city object to the Station table?

  city = City.find_or_create_by(city: row["city"])

  Station.create(name: row["name"],
                 dock_count: row["dock_count"],
                 installation_date: Date.strptime(row["installation_date"], "%m/%d/%Y"),
                 city_id: city.id
                 )
               end

  puts "There are now #{Station.count} rows in the stations table."
end

header = true
Ccsv.foreach('db/csv/weather.csv') do |row|
  if header == false && row[0].to_i < 6000

    weather = Weather.new(date: Date.find_or_create_by(date: row[0]),
                          max_temperature: row[1],
                          mean_temperature: row[2],
                          min_temperature: row[3],
                          mean_humidity: row[8],
                          mean_visibility: row[14],
                          mean_wind_speed: row[17],
                          precipitation: row[19],
                          zip_code: Zipcode.find_or_create_by(zip_code: row[22])
                    )
  end

      puts "There are now #{Weather.count} rows in the weather table"

  header = false
end
