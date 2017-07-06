class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.integer :start_date
      t.integer :start_station
      t.integer :end_date
      t.integer :end_station
      t.integer :bike_id
      t.integer :subscription_type
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
