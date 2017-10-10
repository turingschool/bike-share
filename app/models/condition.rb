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

	def self.temp_breakout(temp_range)
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
	
	def self.total_breakout_temps
		counter = 40
		temps = Hash.new(0)
		while counter <= 100
			temps.merge!(counter =>temp_breakout(counter))
			counter += 10
		end 
	temps
  end 
    
	def self.trips_in_precip_range(precip_range)
		where(precipitation_inches: (precip_range...(precip_range + 0.5)))	
    .joins(:trips)
    .select("conditions.*, count(trips.id) AS trip_count")
    .group("conditions.id")
    .order("count_id DESC").count(:id)
  end
  
  def self.precip_breakout(precips_range)
    conditions_in_range = trips_in_precip_range(precips_range)
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
  
  def self.total_breakout_precips
    counter = 0.0
    precips = Hash.new(0)
    while counter <= 3.5
      precips.merge!(counter => precip_breakout(counter))
      counter += 0.5
    end 
    precips
  end 

  def self.trips_in_wind_speed_range(ws_range)
    where(mean_wind_speed_mph: (ws_range...(ws_range + 0.5)))	
      .joins(:trips)
      .select("conditions.*, count(trips.id) AS trip_count")
      .group("conditions.id")
      .order("count_id DESC").count(:id)
  end 

  def self.wind_speed_breakout(ws_range)
    conditions_in_range = trips_in_wind_speed_range(ws_range)
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

  def self.total_breakout_wind_speeds
    counter = 0.0
    wind_speeds = Hash.new(0)
    while counter <=16.0
      wind_speeds.merge!(counter => wind_speed_breakout(counter))
      counter += 4.0
    end 
    wind_speeds
  end
  
  def self.trips_in_visibility_range(visibility_range)
    where(mean_visibility_miles: (visibility_range...(visibility_range + 4.0)))	
      .joins(:trips)
      .select("conditions.*, count(trips.id) AS trip_count")
      .group("conditions.id")
      .order("count_id DESC").count(:id)
  end 

  def self.visibility_breakout(visibility_range)
    conditions_in_range = trips_in_visibility_range(visibility_range)
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

  def self.total_breakout_visibility
    counter = 0.0
    visibilities = Hash.new(0)
    while counter <= 12.0
      visibilities.merge!(counter => visibility_breakout(counter))
      counter += 4.0
    end 
    visibilities
  end 
end








