class Conditions < ActiveRecord::Base

  #relationships with Station
  #relationships with Trips

  #validates days

  def self.date
    :date #month/day/year
  end

  def self.max_temp
    :max_temperature_f
  end

  def self.mean_temp
    :mean_temperature_f
  end

  def self.min_temp
    :min_temperature_f
  end

  def self.mean_humidity
    :mean_humidity
  end

  def self.mean_visibility
    :mean_visibility_miles
  end

  def self.mean_wind_speed
    :mean_wind_speed_mph
  end

  def self.precipitation
    :precipitation_inches
  end

end
