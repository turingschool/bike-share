class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.date    :start_date
      t.date    :end_date
      t.text    :subscription_type
      t.integer :zip_code
      t.integer :weather_id
      t.integer :bike_id
      t.integer :start_station_id
      t.integer :end_station_id

      t.timestamps null: false
    end
  end
end
