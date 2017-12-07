class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.date :date
      t.float :max_temperature_f
      t.float :mean_temperature_f
      t.float :min_temperature_f
      t.float :mean_humidity
      t.int :mean_visibility_miles
      t.int :mean_wind_speed_mph
      t.int :precipitation_inches
    end
  end
end
