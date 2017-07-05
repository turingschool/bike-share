class CreateWeatherConditionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_conditions do |t|
      t.integer :date_id
      t.float :max_temp_f
      t.float :mean_temp_f
      t.float :min_temp_f
      t.float :mean_humidity
      t.float :mean_visibility
      t.float :mean_wind_speed
      t.float :precipitation
      t.integer :zipcode
    end
  end
end
