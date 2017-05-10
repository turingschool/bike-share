require './app/models/trip'

class Condition < ActiveRecord::Base

  def self.get_paginated_conditions(params)
    self.order(:date).paginate(:page => params[:page], :per_page => 30)
  end

  def self.average_rides_per_temperature_range(degrees)
    days = Condition.days_with_high_temps(degrees)
    ride_count = Trip.total_trip_count_on_dates(days)
    average_number_of_rides(ride_count, days)
  end

  def self.highest_rides_per_temperature_range(degrees)
    days = Condition.days_with_high_temps(degrees)
    Trip.max_trip_count_by_dates(days)
  end

  def self.lowest_rides_per_temperature_range(degrees)
    days = Condition.days_with_high_temps(degrees)
    Trip.min_trip_count_by_dates(days)
  end

  def self.average_number_of_rides(ride_count, days)
    ride_count / days.length
  end

  def self.days_with_high_temps(degrees)
    conditions_in_a_temperature_range = Condition.where(max_temperature: [degrees..degrees + 9])
    conditions_in_a_temperature_range.map { |condition| condition.date }
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
