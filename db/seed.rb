require 'csv'
require '../app/models/trip.rb'
require 'pry'

CSV.foreach('db/csv/trip.csv', :headers=> true) do |row|
  # Trip.create directly
  # or trip import to model? add fixing data before fixdate(row["date"])
  #unique data!!!
  duration: row["duration"],
  start_date: row["start_date"],
  start_station: row["start_station_name"],
  end_date: row["end_date"],
  end_station: row["end_station_name"],
  bike_id: row["bide_id"],
  subscription: row["subscription_type"],
  zipcode: row["zip_code"])

  binding.pry

end
