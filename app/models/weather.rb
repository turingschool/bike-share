# Date
# Max Temperature
# Mean Temperature
# Min Temperature
# Mean Humidity
# Mean Visibility (in Miles)
# Mean Wind Speed (mph)
# Precipitation (inches)


class Weather < ActiveRecord::Base

	validates :date, uniqueness: true

	def self.total
		all.count
	end


	def self.avg_rides

		Weather.find()
		# self.where(max_temperature --put range)

	end

	def self.highest_rides

	end

	def self.lowest_rides

	end

end
