class Condition < ActiveRecord::Base

  def self.get_paginated_conditions(params)
    self.order(:date).paginate(:page => params[:page], :per_page => 30)
  end

  def average_number_of_rides(rides)
    rides.reduce(:+) / rides.count
  end

  def highest_number_of_rides(rides)
      rides.max.to_i
  end

  def lowest_number_of_rides
    rides.min.to_i
  end

  def days_with_high_temps(degrees)
    where(max_temperature: [degrees..degrees + 9])
  end

  def precipitation_increments(inch)
    where(precipitation: [inch..inch + 0.49])
  end

  def speed_increments(speed)
    where(mean_wind_speed: [speed..speed + 3])
  end

  def visibility_in_four_mile_increments(mile)
      where(mean_visibility: [mile..mile + 3])
  end
end
