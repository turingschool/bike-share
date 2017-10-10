class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |trip|
      trip.integer   :duration
      trip.date      :start_date
      trip.integer   :start_station_id
      trip.date      :end_date
      trip.integer   :end_station_id
      trip.integer   :bike_id
      trip.text      :subscription_type
      trip.text      :zip_code
    end
  end
end
