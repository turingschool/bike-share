class Condition < ActiveRecord::Base
	belongs_to :city

  validates :date, :zip_code, :maximum_temperature, :mean_temperature,
    :minimum_temperature, :mean_humidity, :mean_wind_speed, :percipitation,
    :mean_visibility, presence: true

	def self.average_rides(range)
		Trip..start_station.city.condition.where(:maximum_temperature < range[:min] &&
													 				 							 :maximum_temperature > range[:min] + range[:chunk] )

	end

	def highest_rides
	end

	def lowest_rides
	end


end
