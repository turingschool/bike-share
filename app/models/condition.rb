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

  def self.days_within_high_temp(range)
    where(max_temperature_f: [range..range+9])
  end

  def self.days_within_precipitation(range)
    where(precipitation_inches: [range..range+0.49])
  end

  def self.days_within_wind(range)
    where(mean_wind_speed_mph: [range..range+4])
  end

  def self.days_within_visibility(range)
    where(mean_visibility_miles: [range..range+4])
  end

  def self.rides_per_day_desc
    joins(:trips).group(:start_date).order("count_start_date desc").count(:start_date)
  end

  def self.rides_per_day_asc
    joins(:trips).group(:start_date).order("count_start_date asc").count(:start_date)
  end

  def self.min_rides_temp(range)
    if days_within_high_temp(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days_within_high_temp(range).rides_per_day_asc.first[1]
    end
  end

  def self.average_rides_temp(range)
    if days_within_high_temp(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days = days_within_high_temp(range).rides_per_day_asc.values
      days.sum/days.count
    end
  end

  def self.max_rides_temp(range)
    if days_within_high_temp(range).rides_per_day_desc.values.count == 0
      return 0
    else
      days_within_high_temp(range).rides_per_day_desc.first[1]
    end
  end

  def self.min_rides_precip(range)
    if days_within_precipitation(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days_within_precipitation(range).rides_per_day_asc.first[1]
    end
  end

  def self.average_rides_precip(range)
    if days_within_precipitation(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days = days_within_precipitation(range).rides_per_day_asc.values
      # require "pry"; binding.pry
      days.sum/days.count
    end
  end

  def self.max_rides_precip(range)
    if days_within_precipitation(range).rides_per_day_desc.values.count == 0
      return 0
    else
      days_within_precipitation(range).rides_per_day_desc.first[1]
    end
  end

  def self.min_rides_wind(range)
    if days_within_wind(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days_within_wind(range).rides_per_day_asc.first[1]
    end
  end

  def self.average_rides_wind(range)
    if days_within_wind(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days = days_within_wind(range).rides_per_day_asc.values
      days.sum/days.count
    end
  end

  def self.max_rides_wind(range)
    if days_within_wind(range).rides_per_day_desc.values.count == 0
      return 0
    else
      days_within_wind(range).rides_per_day_desc.first[1]
    end
  end

  def self.min_rides_visibility(range)
    if days_within_visibility(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days_within_visibility(range).rides_per_day_asc.first[1]
    end
  end

  def self.average_rides_visibility(range)
    if days_within_visibility(range).rides_per_day_asc.values.count == 0
      return 0
    else
      days = days_within_visibility(range).rides_per_day_asc.values
      days.sum/days.count
    end
  end

  def self.max_rides_visibility(range)
    if days_within_visibility(range).rides_per_day_desc.values.count == 0
      return 0
    else
      days_within_visibility(range).rides_per_day_desc.first[1]
    end
  end

  def self.weather_on_day_with_highest_rides
    select("conditions.*, avg(mean_temperature_f)").joins(:trips).group(:id,:start_date).order("count(date)").last
  end

  def self.weather_on_day_with_lowest_rides
    select("conditions.*, avg(mean_temperature_f)").joins(:trips).group(:id,:start_date).order("count(date)").first
  end

end
