require 'pry'

class Weather < ActiveRecord::Base
  validates :date,
  :max_temperature, :mean_temperature,
  :min_temperature, :mean_humidity,
  :mean_visibility, :mean_wind_speed,
  :precipitation,
  presence: true

  def self.max_trips_in_weather_set(set)
    if set.empty?
      "N/A"
    else
      maximum_weather = set.max_by { |condition| Trip.count_by_date(condition.date.to_s) }
      maximum_weather.date
    end
  end

  def self.min_trips_in_weather_set(set)
    if set.empty?
      "N/A"
    else
      minimum_weather = set.min_by { |condition| Trip.count_by_date(condition.date.to_s) }
      minimum_weather.date
    end
  end

  def self.average_trips_in_weather_set(set)
    total_trips = Trip.count_by_date(set.pluck(:date))
    # total_trips = set.reduce(0) do |total, condition|
    #   total += Trip.count_by_date(condition.date.to_s)
    # end
    return total_trips.to_f / set.count.to_f if set.count > 0
    return total_trips if set.count == 0
  end

  def self.find_all_with_max_temp_in_range(low, high)
    where(:max_temperature => low..high)
  end

  def self.find_max_temp_increment
    low = 40
    conditions = []
    until low == 100
      conditions << find_all_with_max_temp_in_range(low, (low + 10))
      low += 10
    end
    return conditions
  end

  def self.find_all_with_precipitation_in_range(low, high)
    where(:precipitation => low..high)
  end

  def self.find_precipitation_increment
    low = 0.0
    conditions = []
    until low == 3.5
      conditions << find_all_with_precipitation_in_range(low, (low + 0.5))
      low += 0.5
    end
    return conditions
  end

  def self.find_all_with_mean_wind_speed_in_range(low, high)
    where(:mean_wind_speed => low..high)
  end

  def self.find_wind_speed_increment
    low = 0.0
    conditions = []
    until low == 25.0
      conditions << find_all_with_mean_wind_speed_in_range(low, (low + 4.0))
      low += 5.0
    end
    return conditions
  end

  def self.find_all_with_mean_visibility_in_range(low, high)
    where(:mean_visibility => low..high)
  end

  def self.find_visibility_increment
    low = 5.0
    conditions = []
    until low == 15.0
      conditions << find_all_with_mean_visibility_in_range(low, (low + 4.0))
      low += 5.0
    end
    return conditions
  end

  def self.highest_rides_weather
    where(:date => Trip.most_trips_by_date[0].to_s).first
  end

  def self.fewest_rides_weather
    where(:date => Trip.fewest_trips_by_date[0].to_s).first
  end
end
