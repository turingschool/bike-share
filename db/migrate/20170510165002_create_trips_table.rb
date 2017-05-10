class CreateTripsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer  :duration
      t.datetime :start_date
      t.datetime :end_date
      t.integer  :end_station_id
      t.integer  :start_station_id
      t.integer  :subscription_type_id
      t.integer  :zip_code
      t.integer  :city_id
      t.integer  :bike_id
    end
  end
end
