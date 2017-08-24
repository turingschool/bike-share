require 'pry'
class Condition < ActiveRecord::Base

  validates :date, presence: true
  validates :max_temperature_f, presence: true
  validates :mean_temperature_f, presence: true
  validates :min_temperature_f, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph, presence: true
  validates :precipitation_inches, presence: true

  def self.convert_csv_to_condition_attributes
    a = Time.now
    conditions = []
    CSV.foreach('db/csv/weather.csv', {headers: true, header_converters: :symbol}) do |row|
      next if row[:zip_code] != "94107"
    conditions << Condition.new(date:     Date.strptime(row[:date], '%m/%e/%Y'),
                    max_temperature_f:     row[:max_temperature_f],
                    mean_temperature_f:    row[:mean_temperature_f],
                    min_temperature_f:     row[:min_temperature_f],
                    max_humidity:          row[:max_humidity],
                    mean_humidity:         row[:mean_humidity],
                    mean_visibility_miles: row[:mean_visibility_miles],
                    mean_wind_speed_mph:   row[:mean_wind_speed_mph],
                    precipitation_inches:  row[:precipitation_inches]
                    )
    end
    b = Time.now
    puts "Creating the conditions array took #{b - a} seconds"
    conditions
  end

  def self.get_average_rides_temp(range)
    rides = Trip.where(start_date: Condition.where(max_temperature_f: range).pluck(:date)).count
    days = Condition.where(max_temperature_f: range).pluck(:date).count
    if days == 0
      days = 1
    end
    if rides.nil?
      rides = 0
    end
    rides / days
  end

  def self.get_best_day_temp(range)
    rides = Trip.where(start_date: Condition.where(max_temperature_f: range).pluck(:date)).group(:start_date).count.sort_by {|k, v| v}.last
    if rides.nil?
      rides = 0
    else
      rides[1]
    end
  end

  def self.get_worst_day_temp(range)
    rides = Trip.where(start_date: Condition.where(max_temperature_f: range).pluck(:date)).group(:start_date).count.sort_by {|k, v| v}.first
    if rides.nil?
      rides = 0
    else
      rides[1]
    end
  end

  def self.get_average_rides_percip(range)
    rides = Trip.where(start_date: Condition.where(precipitation_inches: range).pluck(:date)).count
    days = Condition.where(max_temperature_f: range).pluck(:date).count
    if days == 0
      days = 1
    end
    if rides.nil?
      rides = 0
    end
    rides / days
  end

  def self.get_best_day_percip(range)
    rides = Trip.where(start_date: Condition.where(precipitation_inches: range).pluck(:date)).group(:start_date).count.sort_by {|k, v| v}.last
    if rides.nil?
      rides = 0
    else
      rides[1]
    end
  end

  def self.get_worst_day_percip(range)
    rides = Trip.where(start_date: Condition.where(precipitation_inches: range).pluck(:date)).group(:start_date).count.sort_by {|k, v| v}.first
    if rides.nil?
      rides = 0
    else
      rides[1]
    end
  end
end
