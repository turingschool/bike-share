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

# date,
# max_temperature_f,
# mean_temperature_f,
# min_temperature_f,
# mean_humidity,
# mean_visibility_miles,
# mean_wind_speed_mph,
# precipitation_inches,
# zip_code

# :max_dew_point_f,
# :mean_dew_point_f,
# :min_dew_point_f,
# :max_humidity,
# :min_humidity,
# :max_sea_level_pressure_inches,
# :mean_sea_level_pressure_inches,
# :min_sea_level_pressure_inches,
# :max_visibility_miles,
# :min_visibility_miles,
# :max_wind_Speed_mph,
# :max_gust_speed_mph,
# :cloud_cover,
# :events,
# :wind_dir_degrees
