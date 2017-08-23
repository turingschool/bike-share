class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.date  :date
      t.float :max_temperature_f
      t.float :mean_temperature_f
      t.float :min_temperature_f
      t.float :max_humidity
      t.float :mean_humidity
      t.float :mean_visibility_miles
      t.float :mean_wind_speed_mph
      t.float :precipitation_inches


      t.timestamps null: false
    end
  end
end
