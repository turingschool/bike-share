class CreateTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|

      t.integer    :duration
      t.date      :start_date
      t.text      :start_station_name
      t.date      :end_date
      t.text      :end_station_name
      t.integer   :bike_id
      t.text      :subscription_type
      t.integer   :zip_code
    end 
  end
end
