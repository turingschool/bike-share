class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration, null: false
      t.datetime :start_date, null: false
      t.integer :start_station_id, null: false
      t.datetime :end_date, null: false
      t.integer :end_station_id, null: false
      t.integer :bike_id, null: false
      t.text :subscription_type, null: false
      t.integer :zipcode_id
    end
  end
end
