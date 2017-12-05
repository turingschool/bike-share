class Condition < ActiveRecord::Base
  self.primary_key = "date"

  validates_presence_of :date,
                        :mean_temperature_f,
                        :max_temperature_f,
                        :min_temperature_f,
                        :mean_humidity,
                        :mean_visibility_miles,
                        :mean_wind_speed_mph,
                        :precipitation_inches

  validates :date, uniqueness: true

  has_many  :trips, :foreign_key => :start_date

  def self.days_within_high_temp(low_temp,high_temp)
    where("max_temperature_f > ? AND max_temperature_f < ?", low_temp,high_temp).count
  end

  def self.days_within_precipitation

  end

  def self.days_within_wind
  end

  def self.days_within_visibility
  end

  def self.rides_per_day
  end

  def self.min_rides_temp
  end

  def self.average_rides_temp
  end

  def self.max_rides_temp
  end

  def self.min_rides_precip
  end

  def self.average_rides_precip
  end

  def self.max_rides_precip
  end

  def self.min_rides_wind
  end

  def self.average_rides_wind
  end

  def self.max_rides_wind
  end

  def self.min_rides_visibility
  end

  def self.average_rides_visibility
  end

  def self.max_rides_visibility
  end

  def self.all_rides_within_wind_speed
  end

  def self.all_rides_within_visibility_range
  end

  def self.all_rides_within_temp_range
  end

  def self.weather_on_day_with_highest_rides
  end

end
