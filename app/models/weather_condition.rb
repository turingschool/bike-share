class WeatherCondition < ActiveRecord::Base

  has_many :trips

  validates :max_temperature_f, presence: true
  validates :min_temperature_f, presence: true
  validates :mean_temperature_f, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph, presence: true
  validates :precipitation_inches, presence: true
  validates :date, presence: true, uniqueness: true

  scope :ordered, -> { order(:date) }

  def self.total
    WeatherCondition.count
  end

end
