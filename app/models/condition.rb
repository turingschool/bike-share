class Condition < ActiveRecord::Base
	belongs_to :city

  validates :date, :zip_code, :maximum_temperature, :mean_temperature,
    :minimum_temperature, :mean_humidity, :mean_wind_speed, :percipitation,
    :mean_visibility, presence: true
end
