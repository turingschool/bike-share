class CreateTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|

      t.integer   :duration
      t.text      :start_date
      t.text      :start_station
      t.text      :end_date
      t.text      :end_station
      t.integer   :bike_id
      t.text      :subscription_type
      t.integer   :zip_code
    end 
  end
end
