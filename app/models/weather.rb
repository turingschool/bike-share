class Weather < ActiveRecord::Base
  validates :date,
  :max_temperature, :mean_temperature,
  :min_temperature, :mean_humidity,
  :mean_visibility, :mean_wind_speed,
  :precipitation,
  presence: true

  def self.max_trips_in_weather_set(set)
    set.max_by { |condition| Trip.count_by_date(condition.date) }
  end

  def self.min_trips_in_weather_set(set)
    set.min_by { |condition| Trip.count_by_date(condition.date) }
  end

  def self.average_trips_in_weather_set(set)
    total_trips = set.reduce(0) do |total, condition|
      total += condition.trips.count
    end
    total_trips / set.count
  end

  def self.find_all_with_max_temp_in_range(low, high)
    where(:max_temperature => low...high)
  end

  def self.find_all_with_precipitation_in_range(low, high)
    where(:precipitation => low...high)
  end

  def self.find_all_with_mean_wind_speed_in_range(low, high)
    where(:mean_wind_speed => low...high)
  end

  def self.find_all_with_mean_visibility_in_range(low, high)
    self.where(:mean_visibility => low...high)
  end

  def self.highest_rides_weather
    self.maximum(&:trips.count)
  end

  def self.lowest_rides_weather
    self.minimum(&:trips.count)
  end
end
