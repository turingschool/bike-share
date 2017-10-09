class Condition < ActiveRecord::Base
  validates :date, uniqueness: { scope: :zip_code }
  validates_presence_of :date,
                        :max_temperature_f,
                        :mean_temperature_f,
                        :min_temperature_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches,
                        :zip_code
  self.per_page = 30
end
