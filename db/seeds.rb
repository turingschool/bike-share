require 'csv'
require './app/models/trip.rb'
require './app/models/bike.rb'


  CSV.foreach('db/csv/trip.csv', :headers=> true) do |row|
    bike = Bike.find_or_create_by(csv_bike_id: row["bike_id"])

    Trip.create!({
    duration: row["duration"],
    start_date: row["start_date"],
    start_station: row["start_station_name"],
    end_date: row["end_date"],
    end_station: row["end_station_name"],
    trip_bike_id: bike.csv_bike_id,
    subscription: row["subscription_type"],
    zipcode: row["zip_code"]})
  end
