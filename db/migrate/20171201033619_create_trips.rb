class CreateTrips < ActiveRecord::Migration[5.1]
  def change
      create_table   :trips do |trip|
        trip.integer         :duration
        trip.date         :start_date
        trip.text         :start_station_name
        trip.integer      :start_station_id
        trip.date         :end_date
        trip.text         :end_station_name
        trip.integer      :end_station_id
        trip.integer      :bike_id
        trip.text         :subscription
        trip.integer      :zip_code
      end
  end

end
