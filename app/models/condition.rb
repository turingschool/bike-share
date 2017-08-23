require 'pry'
class Condition < ActiveRecord::Base
  has_many :condition_trips
  has_many :trips, :through => :condition_trips
  validates :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation, presence: true

  def self.sort_temp_max(range)
    where(max_temperature: range).each do |condition|
      condition.trips.count
    end
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

  def self.sort_temp(range)
    array = where(max_temperature: range).all.map {|condition| condition.date}
    trip_nums = array.map do |date|
      Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
    end
    output = {}
    output[:max] = trip_nums.sort.last
    output[:min] = trip_nums.sort.reverse.last
    output[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
    output
  end
end


