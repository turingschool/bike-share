class Condition < ActiveRecord::Base
  self.primary_key = "date"

  validates_presence_of :date,
                        :mean_temperature_f,
                        :max_temperature_f,
                        :min_temperature_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches,
                        :zip_code

  validates :date, uniqueness: true

  has_many  :trips, :foreign_key => :start_date

end
