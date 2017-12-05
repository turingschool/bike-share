
class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer      :duration
      t.datetime     :start_date
      t.text         :start_station_name
      t.integer      :start_station_id
      t.datetime     :end_date
      t.text         :end_station_name
      t.integer      :end_station_id
      t.text         :bike_id
      t.text         :subscription_type
      t.text         :zip_code

    end
  end
end
