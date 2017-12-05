class CreateConditions < ActiveRecord::Migration[5.1]
  def change
<<<<<<< HEAD
    create_table   :conditions do |t|
    t.date         :date
    t.integer      :max_temperature
    t.integer      :mean_temperature
    t.integer      :min_temperature
    t.integer      :mean_humidity
    t.integer      :mean_visibility
    t.integer      :mean_wind_speed
    t.integer      :precipitation
    end
  end

 
=======
      create_table   :conditions do |t|
      t.integer      :duration
      t.date         :start_date
      t.text         :start_station_name
      t.integer      :start_station_id
      t.date         :end_date
      t.text         :end_station_name
      t.integer      :end_station_id
      t.integer      :bike_id
      t.text         :subscription
      t.integer      :zip_code
    end
  end
>>>>>>> it6
end
