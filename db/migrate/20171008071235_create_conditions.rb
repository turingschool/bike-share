class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |conditions|
      conditions.date   :date
      conditions.float  :max_temperature_f
      conditions.float  :mean_temperature_f
      conditions.float  :min_temperature_f
      conditions.float  :mean_humidity
      conditions.float  :mean_visibility_miles
      conditions.float  :mean_wind_speed_mph
      conditions.float  :precipitation_inches
    end
  end
end
