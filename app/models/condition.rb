class Condition < ActiveRecord::Base

  def self.get_paginated_conditions(params)
    self.order(:date).paginate(:page => params[:page], :per_page => 30)
  end

  def self.average_number_of_rides(rides)
    rides.reduce(:+) / rides.count
  end

  def self.highest_number_of_rides(rides)
      rides.max.to_i
  end

  def self.lowest_number_of_rides
    rides.min.to_i
  end

  def self.days_with_high_temps(degrees)
    where(max_temperature: [degrees..degrees + 9])
  end

  def self.precipitation_increments(inch)
    where(precipitation: [inch..inch + 0.49])
  end

  def self.speed_increments(speed)
    where(mean_wind_speed: [speed..speed + 3])
  end

  def self.visibility_in_four_mile_increments(mile)
      where(mean_visibility: [mile..mile + 3])
  end
end
