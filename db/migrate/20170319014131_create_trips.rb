class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.date    :start_date
      t.text    :start_station_name
      t.integer :start_station_id
      t.date    :end_date
      t.text    :end_station_name
      t.integer :end_station_id
      t.integer :bike_id
      t.text    :subscription_type
      t.integer :zip_code
    end
  end
end
