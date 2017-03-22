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

end
