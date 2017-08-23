require 'pry'
class Condition < ActiveRecord::Base
  belongs_to :trip
  validates :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation, presence: true

  def self.id_by_date(date)
    find_by(date: date).id
  end

  def self.sort_temp_max(range)
    trip_nums = trips_by_temp(range)
    trip_nums.sort.last
  end

  def self.sort_temp_avg(range)
    trip_nums = trips_by_temp(range)
    if trip_nums.length == 0
      trip_nums.inject(:+) / trip_nums.length
    else
      nil
    end
  end

  def self.sort_temp_min(range)
    trip_nums = trips_by_temp(range)
    trip_nums.sort.reverse.last
  end

  private

  def self.trips_by_temp(range)

    date_array = where(max_temperature: range).pluck(:date)

    output = []

    date_array.each do |date|
      output = Trip.where(start_date: date.beginning_of_day...date.end_of_day).count
    end
    output
  end

end


