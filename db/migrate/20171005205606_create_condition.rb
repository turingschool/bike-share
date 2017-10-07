class CreateCondition < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |c|

      c.date :date
      c.float :max_temperature_f
      c.float :mean_temperature_f
      c.float :min_temperature_f
      c.float :mean_humidity
      c.float :mean_visibility_miles
      c.float :mean_wind_speed_mph
      c.float :precipitation_inches
      c.text :zip_code

    end
  end
end
