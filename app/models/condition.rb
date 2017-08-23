require 'pry'
class Condition < ActiveRecord::Base
  has_many :condition_trips
  has_many :trips, :through => :condition_trips
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
    where(mean_wind_speed: range).order('mean_wind_speed DESC').each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  def self.sort_wind_min(range)
    amount = []
    where(mean_wind_speed: range).order('mean_wind_speed ASC').each do |condition|
      amount << condition.trips
    end
    amount.size
  end

  #################### NEEDS REFACTOR... TOO MANY SQL QUERIES
  def self.sort_wind_mean(range)
    amount = 0
    length = where(mean_wind_speed: range).count
    where(mean_wind_speed: range).each do |condition|
      amount += Trip.where(start_date: condition[:date]).count
    end
    amount / length
  end
end


