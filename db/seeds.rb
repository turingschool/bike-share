require 'ccsv'
require 'pry'
require './app/models/trip'
require './app/models/subscription_type'
require './app/models/trip_date'
require './app/models/trip_time'
require './app/models/zip_code'

DATES = {}
TIMES = {}
ZIP_CODES = {}

def compute_subscription_id(subscription_string)
  if subscription_string[0] == "S"
    1
  else
    2
  end
end

def handle_date(date)
  date = date.split(" ")
  add_to_date_hash(date[0])
end

def handle_time(date)
  date = date.split(" ")
  add_to_time_hash(date[1])
end

def add_to_time_hash(time)
  if TIMES[time].nil?
    TIMES[time] = TIMES.count + 1
  else
    TIMES[time]
  end
end

def add_to_date_hash(date)
  if DATES[date].nil?
    DATES[date] = DATES.count + 1
  else
    DATES[date]
  end
end

def add_to_zip_code_hash(zip)
  if ZIP_CODES[zip].nil?
    ZIP_CODES[zip] = ZIP_CODES.count + 1
  else
    ZIP_CODES[zip]
  end
end

header = true
Ccsv.foreach('db/csv/trip.csv') do |row|
  if header == false
    trip = Trip.new(duration: row[1],
                    start_day: handle_date(row[2]),
                    start_time: handle_time(row[2]),
                    start_station: row[4],
                    end_time: handle_time(row[5]),
                    end_day: handle_date(row[5]),
                    end_station: row[7],
                    bike_id: row[8],
                    subscription_type_id: compute_subscription_id(row[9]),
                    zip_code: add_to_zip_code_hash(row[10]))
    trip.save
    puts "Adding trip #{row[0]} to the table"
  end
  header = false
end

puts "There are now #{Trip.count} rows in the trips table"

ZIP_CODES.each do |id, value|
  zip_code = ZipCode.new(
                      id: id,
                      zip_code: value

                        )
  zip_code.save
end

DATES.each do |id, value|
  date = TripDate.new(
                      id: id,
                      trip_date: value
                      )
  date.save
end

TIMES.each do |id, value|
  time = TripTime.new(
                      id: id,
                      trip_time: value
  )
  time.save
end

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
