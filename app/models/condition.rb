class Condition < ActiveRecord::Base
  has_many :trips

  validates :date, presence: true, uniqueness: true
  validates :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_windspeed, :precipitation, presence: true

end
