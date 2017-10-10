require 'will_paginate'
require 'will_paginate/active_record'

class Condition < ActiveRecord::Base
  has_many :trips, primary_key: "date", foreign_key: "start_date"
  validates :date, uniqueness: { scope: :zip_code }
  validates_presence_of :date

  self.per_page = 30

  def self.id_by_date(date)
    find_by(date: date).id
  end 
  
	def self.trips_in_temp_range(temp_range)
    #this gives me a table with as many rows as there are conditions
    #with a column that has the number of trips associated with each. 
    #each object has a trip count on it
    where(max_temperature_f: (temp_range...(temp_range + 10)))
            .joins(:trips)
            .select("conditions.*, count(trips.id) AS trip_count")
            .group("conditions.id")
            .order("count_id DESC").count(:id)    
  end 

#  def self.all_conditions_in_temp_range(low, high)
 #   (max_temperature_f: low..high)
 # end

	def self.breakout(temp_range)
		conditions_in_range = trips_in_temp_range(temp_range)
    view_data = Hash.new(0)
    view_data[:min] = (conditions_in_range.values.last)
    view_data[:max] = (conditions_in_range.values.first)
    
    if conditions_in_range.values.count != 0
      view_data[:avg] = conditions_in_range.values.sum/ conditions_in_range.values.count
    else 
      view_data[:avg] = 0
    end 
    view_data
	end 
	
	def self.breakout_temps
		counter = 40
		temps = Hash.new(0)
		while counter <= 100
			temps.merge!(counter => breakout(counter))
			counter += 10
		end 
	temps
	end 
  
	def self.most_rides(conditions)
		conditions.max_by {|condition| condition.trips.count}
	end

	def self.least_rides(conditions)
		conditions.min_by {|condition| condition.trips.count}
  end
  
end
