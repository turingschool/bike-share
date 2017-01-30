require 'csv'
require './app/models/trip.rb'


def import_trip_csv
  CSV.foreach('db/csv/trip.csv', :headers=> true) do |row|
    Trip.create!({
    duration: format_duration(row["duration"]),
    start_date: row["start_date"],
    start_station: row["start_station_name"],
    end_date: row["end_date"],
    end_station: row["end_station_name"],
    bike_id: row["bide_id"],
    subscription: row["subscription_type"],
    zipcode: row["zip_code"]})
  end

  def format_duration

  end
end
