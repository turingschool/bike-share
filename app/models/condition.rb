class Condition < ActiveRecord::Base
  has_many :trips

  attr_reader :temp_range

  def self.trips_by_max_temp
    @temp_range ||= {}
    x = 40
    6.times do
      @temp_range[x] = Condition.where(max_temp: x..(x+9))
      x += 10
    end
    @temp_range
  end

  def self.ride_temp_analysis
    ride_counts = {}
    trips_by_max_temp.each do |k, v|
      ride_counts[k] = v.to_a.map do |condition|
        condition.trips.count
      end
    end
    ride_counts
  end

  def self.average_rides_max_temp
    ride_average = {}
    ride_temp_analysis.each do |k, v|
      ride_average[k] = (v.reduce(:+).to_f / v.count).round(2)
    end
    ride_average
  end

  def self.max_rides_max_temp
    ride_max = {}
    ride_temp_analysis.each do |k, v|
      ride_max[k] = v.max
    end
    ride_max
  end

  def self.min_rides_max_temp
    ride_min = {}
    ride_temp_analysis.each do |k, v|
      ride_min[k] = v.min
    end
    ride_min
  end

  def self.conditions_by_precipitation
    precipitation = {}
    x = 0.0
    7.times do
      precipitation[x] = Condition.where(precipitation: x..(x + 0.49))
      x += 0.5
    end
    precipitation
  end

  def self.precipitation_analysis
    ride_counts = {}
    conditions_by_precipitation.each do |k, v|
        if v.count == 0
          ride_counts[k] = 0
        else
        ride_counts[k] = v.to_a.map do |condition|
          condition.trips.count
        end
      end
    end
    ride_counts
  end

  def self.average_rides_precipitation
    ride_average = {}
    precipitation_analysis.each do |k, v|
      if v == 0
        ride_average[k] = 0
      else
        ride_average[k] = (v.reduce(:+).to_f / v.count).round(2)
      end
    end
    ride_average
  end

  def self.max_rides_precipitation
    ride_max = {}
    precipitation_analysis.each do |k, v|
      if v == 0
        ride_max[k] = 0
      else
        ride_max[k] = v.max
      end
    end
    ride_max
  end

  def self.min_rides_precipitation
    ride_min = {}
    precipitation_analysis.each do |k, v|
      if v == 0
        ride_min[k] = 0
      else
        ride_min[k] = v.min
      end
    end
    ride_min
  end

  def self.conditions_by_wind
    wind = {}
    x = 0.0
    6.times do
      wind[x] = Condition.where(mean_wind: x..(x + 3.99))
      x += 4.0
    end
    wind
  end

  def self.wind_analysis
    ride_counts = {}
    conditions_by_wind.each do |k, v|
      if v.count == 0
        ride_counts[k] = 0
      else
        ride_counts[k] = v.to_a.map do |condition|
          condition.trips.count
        end
      end
    end
    ride_counts
  end

  def self.average_rides_wind
    ride_average = {}
    wind_analysis.each do |k, v|
      if v == 0
        ride_average[k] = 0
      else
        ride_average[k] = (v.reduce(:+).to_f / v.count).round(2)
      end
    end
    ride_average
  end

  def self.max_rides_wind
    ride_max = {}
    wind_analysis.each do |k, v|
      if v == 0
        ride_max[k] = 0
      else
        ride_max[k] = v.max
      end
    end
    ride_max
  end

  def self.min_rides_wind
    ride_min = {}
    wind_analysis.each do |k, v|
      if v == 0
        ride_min[k] = 0
      else
        ride_min[k] = v.min
      end
    end
    ride_min
  end

  def self.conditions_by_visibility
    visibility = {}
    x = 0.0
    3.times do
      visibility[x] = Condition.where(mean_visibility: x..(x + 3.99))
      x += 4.0
    end
    visibility
  end

  def self.visibility_analysis
    ride_counts = {}
    conditions_by_visibility.each do |k, v|
      if v.count == 0
        ride_counts[k] = 0
      else
        ride_counts[k] = v.to_a.map do |condition|
          condition.trips.count
        end
      end
    end
    ride_counts
  end

  def self.average_rides_visibility
    ride_average = {}
    visibility_analysis.each do |k, v|
      if v == 0
        ride_average[k] = 0
      else
        ride_average[k] = (v.reduce(:+).to_f / v.count).round(2)
      end
    end
    ride_average
  end

  def self.max_rides_visibility
    ride_max = {}
    visibility_analysis.each do |k, v|
      if v == 0
        ride_max[k] = 0
      else
        ride_max[k] = v.max
      end
    end
    ride_max
  end

  def self.min_rides_visibility
    ride_min = {}
    visibility_analysis.each do |k, v|
      if v ==0
        ride_min[k] = 0
      else
        ride_min[k] = v.min
      end
    end
    ride_min
  end

  def self.conditions_for_busiest_day
    find_by(date: Trip.busiest_day_date)
  end

  def self.conditions_for_least_busy_day
    find_by(date: Trip.least_busy_day_date)

  end

end