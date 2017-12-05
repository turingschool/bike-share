class CreateWeather < ActiveRecord::Migration[5.1]
  def change
    create_table "conditions", force: :cascade do |t|
      t.datetime "date"
      t.float "max_temperature_f"
      t.float "mean_temperature_f"
      t.float "min_temperature_f"
      t.float "mean_humidity"
      t.float "mean_visibility_miles"
      t.float "mean_wind_speed_mph"
      t.float "precipitation_inches"
    end
  end
end
