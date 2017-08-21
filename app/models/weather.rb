class Weather < ActiveRecord::Base
  # belongs_to :date
  # belongs_to :zip_code

  validates :date_id,
  :max_temperature, :mean_temperature,
  :min_temperature, :mean_humidity,
  :mean_visibility, :mean_wind_speed,
  :precipitation, :zip_code_id,
  presence: true
end
