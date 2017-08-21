require 'ccsv'
require 'pry'
require './app/models/trip'
require './app/models/subscription_type'
require './app/models/start_date'
require './app/models/end_date'
require './app/models/zip_code'

TOTAL = []

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

def check_for_unique_dates(day1, day2, line)
  if day1 != day2
    TOTAL << line
  end
end

header = true

SubscriptionType.destroy_all

Ccsv.foreach('db/csv/subscription_type.csv') do |row|
  if header == false
    subscription = SubscriptionType.new(
                    id: row[0],
                    subscription_type: row[1]
                    )
    subscription.save
  end
  header = false
end

Trip.destroy_all
StartDate.destroy_all
EndDate.destroy_all
ZipCode.destroy_all

header = true
Ccsv.foreach('db/csv/trip.csv') do |row|
  if header == false && row[0].to_i < 6000
    trip = Trip.new(duration: row[1],
                    start_station: row[4],
                    end_station: row[7],
                    bike_id: row[8],
                    )
      trip.start_date = StartDate.find_or_create_by(date: get_date(row[2]))
      trip.end_date = EndDate.find_or_create_by(date: get_date(row[5]))
      trip.subscription_type = SubscriptionType.find(compute_subscription_id(row[9]))
      trip.zip_code = ZipCode.find_or_create_by(zip_code: row[10])
      trip.save

      puts "Adding trip #{row[0]} to the table"

  end
  header = false

end

puts "There are now #{Trip.count} rows in the trips table"
puts "There are #{total} duplicate dates."




# DATES.each do |id, value|
#   date = TripDate.new(
#                       id: id,
#                       trip_date: value
#                       )
#   date.save
# end
#
# TIMES.each do |id, value|
#   time = TripTime.new(
#                       id: id,
#                       trip_time: value
#   )
#   time.save
# end

#
# puts "There are now #{SubscriptionType.count} rows in the trips table"



# id,duration,start_date,start_station_name,start_station_id
# ,end_date,end_station_name,end_station_id,bike_id,subscription_type,
# zip_code
