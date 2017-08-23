require './app/models/trip'
class Condition < ActiveRecord::Base
	validates :weather_date,     presence: true
	validates :max_temperature,  presence: true
	validates :mean_temperature, presence: true
	validates :min_temperature,  presence: true
	validates :mean_humidity,    presence: true
	validates :mean_visibility,  presence: true
	validates :mean_wind_speed,  presence: true
	validates :precipitation,    presence: true
	
	has_many :trips, class_name: "Trip", foreign_key: "condition_id"
	def self.id_by_date(date)
		find_by(weather_date: date).id
	end
	
	def self.join_table
		self.joins(:trips)
	end
		
	def breakout_temp(temp_range)
		max = trip_arr(temp_range).max
		min = trip_arr(temp_range).min
		# range = Condition.where(max_temperature: (temp_range...(temp_range + 10))).map(&:trips).map(&:count)
		# [max] = Condition.where(max_temperature: (temp_range...(temp_range + 10))).map(&:trips).map(&:count).max
		# [min] = Condition.where(max_temperature: (temp_range...(temp_range + 10))).map(&:trips).map(&:count).min
		average = trip_arr(temp_range).sum / trip_arr(temp_range).count 
		
	end
	
	def trip_arr(temp_range)
		join_table..where(max_temperature: (temp_range...(temp_range + 10)))
	end
	
	def breakout_temps
		counter = 40.0
		until counter == 100
			breakout_temp(counter)
			counter += 10
		end
	end
end
