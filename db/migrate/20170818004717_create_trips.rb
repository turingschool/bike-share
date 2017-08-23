class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer   :duration
      t.date      :start_date
      t.date      :end_date
      t.integer   :start_station
      t.integer   :end_station
      t.integer   :bike_id
      t.integer   :subscription_type_id
      t.integer   :zip_code
    end
  end
end
