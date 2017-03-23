class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.date    :date
      t.integer :max_temperature_f
      t.integer :mean_temperature_f
      t.integer :min_temperature_f
      t.integer :mean_humidity
      t.integer :mean_visibility_miles
      t.integer :mean_wind_speed_mph
      t.integer :precipitation_inches
      t.integer :zip_code
    end
  end
end
