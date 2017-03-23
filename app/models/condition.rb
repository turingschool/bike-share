class Condition < ActiveRecord::Base
  has_many :trips

  validates :date, presence: true
  validates :max_temperature_f, presence: true
  validates :mean_temperature_f, presence: true
  validates :min_temperature_f, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph, presence: true
  validates :precipitation_inches, presence: true
  validates :zip_code, presence: true


  def self.highest_ride_weather
    where(date: Trip.highest_number_trips_date.first.to_s)
  end

  def self.fewest_ride_weather
    where(date: Trip.fewest_number_trips_date.first.to_s)
  end

  def self.temperature_ranges
    min_temp = minimum(:max_temperature_f)
    max_temp = maximum(:max_temperature_f)
    total_range = (min_temp..max_temp)
    total_range.each_slice(10)
  end

  def self.date_in_temperature_ranges
    temperature_ranges.map do |range|
      where(max_temperature_f: range).map(&:date)
    end

  end

  def self.rides_per_day
    date_in_temperature_ranges.map do |range|
      range.map do |date|
        Trip.where(start_date: date)
      end
    end
  end
  # rides_per_day = For each date range, determine the number of rides
  # on those days
  # rides_per_day.max
  # rides_per_day.average
  # rides_per_day.min


  # [13] pry(Condition)> x.map do |x|
  # [13] pry(Condition)*   x.count
  # [13] pry(Condition)* end
  # Condition.where(max_temperature_f: range)

end
