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
	validates :zip_code,         presence: true

	has_many :trips, class_name: "Trip", foreign_key: "condition_id"
	
	def self.id_by_date(date)
		find_by(weather_date: date).id
	end
	
	# def self.join_table
	# 	self.joins(:trips)
	# end
		
	def self.breakout_temp(temp_range)
		range = trip_arr(temp_range)
		answers = Hash.new(0)
		answers[:min] = range.values.last
		answers[:max] = range.values.first
		answers[:avg] = range.values.sum / range.values.count
		answers
	end
	
	def self.trip_arr(temp_range)
		select("condition.*, sum(trip.condition_id) AS total_trips")
			.joins(:trips).where(max_temperature: (temp_range...(temp_range + 10)))
			.group(:conditions).order("count_id DESC").count(:id)
		# Condition.joins(:trips).where(max_temperature: (temp_range...(temp_range + 10)))
		# 	.group(:conditions).order("count_id DESC").count(:id)
	end
	
	def self.breakout_temps
		counter = 50.0
		breakout = Hash.new(0)
		until counter == 100
			breakout.merge!(counter=>breakout_temp(counter))
			counter += 10
		end
	end

end

# Condition.select("conditions.*, sum(trip.condition_id) AS total_trips")
# 	.joins(:trips).where(max_temperature: (50.0...60.0))
# 	.group(:conditions).order("count_id DESC").count(:id)
