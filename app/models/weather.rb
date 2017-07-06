require 'will_paginate'
require 'will_paginate/active_record'

class Weather < ActiveRecord::Base
  validates_presence_of :date, :max_temperature, :min_temperature, :mean_temperature,
  :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation
  has_many :trips

  def self.per_page
    30
  end

  def self.rides_by_max_temp
    Weather.calculate_rides("max_temperature", 10)
  end

  def self.rides_by_precipitation
    Weather.calculate_rides("precipitation", 0.5)
  end

  def self.rides_by_mean_wind_speed
    Weather.calculate_rides("mean_wind_speed", 4)
  end

  def self.rides_by_mean_visibility
    Weather.calculate_rides("mean_visibility", 4)
  end

  def self.highest_rides_weather
    weather = Weather.find_by(date: Date.strptime(Trip.date_with_highest_trip_count, "%m/%d/%Y"))
    weather.attributes.delete_if {|k,v| k == "id" || k == "date"}
  end

  def self.lowest_rides_weather
    weather = Weather.find_by(date: Date.strptime(Trip.date_with_lowest_trip_count, "%m/%d/%Y"))
    weather.attributes.delete_if {|k,v| k == "id" || k == "date"}
  end

  def self.calculate_rides(condition, increment)
    result = {}
    result["average"] = Weather.average_rides(condition, increment)
    result["highest"] = Weather.highest_rides(condition, increment)
    result["lowest"] = Weather.lowest_rides(condition, increment)
    return result
  end

  def self.average_rides(condition, increment)
    results = {}
    counter = Weather.counter(condition, increment)
    upper_limit = Weather.upper_limit(condition, increment)
    until counter == upper_limit do
      range = Weather.join_table.where("#{condition} >= ? AND #{condition} < ?", counter, counter + increment)
      trip_count = range.count
      day_count = range.pluck("date").uniq.count
      results[[counter, counter + increment]] = trip_count/day_count if day_count != 0
      counter += increment
    end
    return results
  end

  def self.highest_rides(condition, increment)
    results = {}
    counter = Weather.counter(condition, increment)
    upper_limit = Weather.upper_limit(condition, increment)
    until counter == upper_limit do
      range = Weather.join_table.where("#{condition} >= ? AND #{condition} < ?", counter, counter + increment)
      max = range.group("date").count("id").values.max
      results[[counter, counter + increment]] = max if max
      counter += increment
    end
    return results
  end

  def self.lowest_rides(condition, increment)
    results = {}
    counter = Weather.counter(condition, increment)
    upper_limit = Weather.upper_limit(condition, increment)
    until counter == upper_limit do
      range = Weather.join_table.where("#{condition} >= ? AND #{condition} < ?", counter, counter + increment)
      min = range.group("date").count("id").values.min
      results[[counter, counter + increment]] = min if min
      counter += increment
    end
    return results
  end

  def self.join_table
    Trip.joins(:weather)
  end

  def self.counter(condition, increment)
    (Weather.join_table.minimum(condition)/increment).to_i * increment
  end

  def self.upper_limit(condition, increment)
    (Weather.join_table.maximum(condition)/increment + 1).to_i * increment
  end
end
