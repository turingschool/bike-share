require 'will_paginate'
require 'will_paginate/active_record'

class Condition < ActiveRecord::Base
  has_many :trips, foreign_key: "start_date"
  validates :date, uniqueness: { scope: :zip_code }
  validates_presence_of :date

  self.per_page = 30

  def self.average_rides_high_temp
  # isolate a range




    # whatever_for_now = select("conditions.*, COUNT(trip_id) AS trip_count")
    #   .joins("LEFT JOIN trips ON trips.start_date = conditions.date")
    #   # .group(:max_temperature_f)
    #   require 'pry'; binding.pry
    #   average(whatever_for_now.trip_count)
  end


  def self.all_conditions_in_temp_range(low, high)
    where(max_temperature_f: low..high)
  end

  def self.all_days_in_temp_range
    temp = 0
    while temp < 100
      all_conditions_in_temp_range(temp, temp+10)
      temp += 10
    end
  end

  def self.average_trips_per_increment(conditions)
    total_trips = conditions.reduce(0) do |sum, condition|
      sum + condition.trips.count
    end
    total_trips / conditions.count
  end

end
