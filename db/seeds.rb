require 'ccsv'
require 'pry'
require './app/models/trip'
require './app/models/subscription_type'

DATES = {}
DATEID = 1

def compute_subscription_id(subscription_string)
  if subscription_string[0] == "S"
    1
  else
    2
  end
end

def handle_date(start_time, end_time)
  start_time = start_time.split(" ")
  end_time = end_time.split(" ")
  compute_trip_duration(start_time[1], end_time[1])
  add_to_date_hash(start_time[0])
  add_to_date_hash(end_time[0])
end

def compute_trip_duration(start_time, end_time)
  # convert time to hours
  # hour number - hour number
  # start_time - end_time
end

def add_to_date_hash(date)
  if DATES[date].nil?
    DATES[date] = DATEID
    DATEID += 1
  end
end

header = true
Ccsv.foreach('db/csv/trip.csv') do |row|
  if header == false
    trip = Trip.new(id: row[0],
                    duration: row[1],
                    start_date: row[2],
                    start_station: row[4],
                    end_date: row[5],
                    end_station: row[7],
                    bike_id: row[8],
                    subscription_type_id: compute_subscription_id(row[9]),
                    zip_code: row[10])
                    binding.pry
    subscription.save
    trip.save
  end
  header = false
end

puts "There are now #{Trip.count} rows in the trips table"

# Ccsv.foreach('db/csv/subscription_type.csv') do |row|
#   if header == false
#     subscription = SubscriptionType.new(id: row[0],
#                     subscription_type: row[1],
#                     )
#     subscription.save
#   end
#   header = false
# end
#
# puts "There are now #{SubscriptionType.count} rows in the trips table"



# id,duration,start_date,start_station_name,start_station_id
# ,end_date,end_station_name,end_station_id,bike_id,subscription_type,
# zip_code
