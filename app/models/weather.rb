class Weather < ActiveRecord::Base
  belongs_to :date
  belongs_to :zip_code
  has_many :startdates, through: :date
  has_many :enddates, through: :date
  has_many :trips, through: :startdates
  has_many :trips, through: :enddates

  validates :date_id,
  :max_temperature, :mean_temperature,
  :min_temperature, :mean_humidity,
  :mean_visibility, :mean_wind_speed,
  :precipitation, :zip_code_id,
  presence: true

  def self.max_trips_in_weather_set(set)
    set.max_by { |condition| condition.trips.count }
  end

  def self.min_trips_in_weather_set(set)
    set.min_by { |condition| condition.trips.count }
  end

  def self.average_trips_in_weather_set(set)
    total_trips = set.reduce(0) do |total, condition|
      total += condition.trips.count
    end
    total_trips / set.count
  end

  def self.find_all_with_max_temp_in_range(low, high)
    self.find_by "? <= max_temperature <= ?", low, high
  end

  def self.find_all_with_precipitation_in_range(low, high)
    self.find_by "? <= precipitation <= ?", low, high
  end

  def self.find_all_with_mean_wind_speed_in_range(low, high)
    self.find_by "? <= mean_wind_speed <= ?", low, high
  end

  def self.find_all_with_mean_visibility_in_range(low, high)
    self.find_by "? <= mean_visibility <= ?", low, high
  end

end
