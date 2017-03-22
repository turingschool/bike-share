class CreateTripTable < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.string :start_date
      t.integer :start_station_id
      t.string :end_date
      t.integer :end_station_id
      t.integer :bike_id
      t.string :subscription_type
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
