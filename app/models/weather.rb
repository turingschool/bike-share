class Weather < ActiveRecord::Base
  validates_presence_of :date, :max_temperature, :min_temperature, :mean_temperature,
  :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation
  has_many :trips
end
