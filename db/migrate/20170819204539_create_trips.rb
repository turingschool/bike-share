class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :start_station_id
      t.integer :end_station_id
      t.date    :start_date
      t.date    :end_date
      t.integer :duration
      t.integer :bike_id
      t.string  :subscription_type
      t.string  :zip_code
    end
  end
end
