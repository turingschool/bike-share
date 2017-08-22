require 'pry'
class Condition < ActiveRecord::Base
  has_many :trips
  validates :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation, presence: true

  def self.sort_temp(range)
    trip_nums = trips_by_temp(range)
    output = {}
    output[:max] = trip_nums.sort.last
    output[:min] = trip_nums.sort.reverse.last
    output[:avg] = trip_nums.inject(:+) / trip_nums.length unless trip_nums.length == 0
    output
  end

  private

  def self.trips_by_temp(range)

    date_array = where(max_temperature: range).pluck(:date)

    date_array.each do |date|
      output = Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
    end
    output
  end

end


