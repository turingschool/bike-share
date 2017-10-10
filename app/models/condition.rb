class Condition < ActiveRecord::Base
  validates_presence_of(
    :date,
    :max_temperature_f,
    :mean_temperature_f,
    :min_temperature_f,
    :mean_humidity,
    :mean_visibility_miles,
    :mean_wind_speed,
    :precipitation_inches
  )
end
