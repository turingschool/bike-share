require 'csv'
require './app/models/trip.rb'

  def load_trips
    conn = ActiveRecord::Base.connection
    rc = conn.raw_connection
    rc.exec("COPY trips (duration, start_date, start_station, end_date,
                        end_station, bike_id, subscription_type,
                        zip_code) FROM STDIN WITH CSV")
    file = File.open('./app/db/csv/trip.csv*', 'r')
    rc.put_copy_data(file.readline)
  end


load_trips
