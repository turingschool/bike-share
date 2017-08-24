require 'pry'
class Condition < ActiveRecord::Base
  has_many :trips
  validates :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation, presence: true

  def self.sort_temp_max(range)
    amount = []
    where(max_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_temp_min(range)
    amount = []
    where(min_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_temp_mean(range)
    amount = []
    where(mean_temperature: range).each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_wind_max(range)
    amount = []
    where(mean_wind_speed: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_wind_min(range)
    amount = []
    where(mean_wind_speed: range).order('mean_wind_speed ASC').each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_wind_mean(range)
    amount = 0
    length = where(mean_wind_speed: range).count
    where(mean_wind_speed: range).each do |condition|
      condition.trips.each do |trip|
        amount += 1 if trip.start_date == condition.date
      end
    end
    amount / length
  end

  def self.sort_precip_max(range)
    amount = []
    where(precipitation: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_precip_min(range)
    amount = []
    where(precipitation: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_precip_mean(range)
    amount = 0
    length = where(precipitation: range).count
    where(precipitation: range).each do |condition|
      condition.trips.each do |trip|
        amount += 1 if trip.start_date == condition.date
      end
    end
    amount / length
  end

  def self.sort_sight_max(range)
    amount = []
    where(mean_visibility: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_sight_min(range)
    amount = []
    where(mean_visibility: range).each do |condition|
      condition.trips.each do |trip|
        amount << trip if trip.start_date == condition.date
      end
    end
    amount.size
  end

  def self.sort_sight_mean(range)
    amount = 0
    length = where(mean_visibility: range).count
    where(mean_visibility: range).each do |condition|
      condition.trips.each do |trip|
        amount += 1 if trip.start_date == condition.date
      end
    end
    amount / length
  end

  # Show Methods
  def self.condition_on_day_with_highest_rides
    day_with_highest_rides = Trip.date_with_highest_number_of_trips
    result = Condition.find_by(date: day_with_highest_rides)
    return "Average Temp: #{result.mean_temperature}, Average Windspeed: #{result.mean_wind_speed}, Precipitation: #{result.precipitation}"
  end

  def self.condition_on_day_with_lowest_rides
    day_with_lowest_rides = Trip.date_with_lowest_number_of_trips
    result = Condition.find_by(date: day_with_lowest_rides)
    return "Average Temp: #{result.mean_temperature}, Average Windspeed: #{result.mean_wind_speed}, Precipitation: #{result.precipitation}"
  end
end
