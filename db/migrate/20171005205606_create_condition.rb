class CreateCondition < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |c|

      c.text :date
      c.float :max_temperature
      c.float :mean_temperature
      c.float :min_temperature
      c.float :mean_humidity
      c.float :mean_visibility_miles
      c.float :mean_wind_speed_mph
      c.float :mean_precipitation_inches

  end
end
