class Condition < ActiveRecord::Base

  validates_presence_of :date,
                        :mean_temperature_f,
                        :max_temperature_f,
                        :min_temperature_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches,
                        :zip_code

	has_many :trips, :class_name => "Trip", :foreign_key => "condition_id"

  def self.id_by_date(date)
  		find_by(weather_date: date).id
  	end

end
