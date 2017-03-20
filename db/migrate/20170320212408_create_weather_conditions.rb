class CreateWeatherConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_conditions do |t|
      t.float :max_temperature_f
      t.float :min_temperature_f
      t.float :mean_temperature_f
      t.float :mean_humidity
      t.float :mean_visibility_miles
      t.float :mean_wind_speed_mph
      t.float :precipitation_inches
      t.date  :date

      t.timestamps null: false
    end
  end
end
