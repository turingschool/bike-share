class Condition < ActiveRecord::Base
  has_many :trips

  validates :date, presence: true, uniqueness: true
  validates :max_temp, presence: true,
  validates :mean_temp, presence: true,
  validates :min_temp, presence: true,
  validates :mean_humidity, presence: true,
  validates :mean_visibility, presence: true,
  validates :mean_wind_speed, presence: true,
  validates :precipitation, presence: true,
  
end
