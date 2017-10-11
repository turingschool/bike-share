class Condition < ActiveRecord::Base
  self.primary_key = "date"

  has_many :trips , class_name: "Trip", primary_key: "date", foreign_key: "start_date"

  validates :date,                  presence: true, uniqueness: true
  validates :max_temperature_f,     presence: true
  validates :min_temperature_f,     presence: true
  validates :mean_temperature_f,    presence: true
  validates :mean_humidity,         presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph,   presence: true
  validates :precipitation_inches,  presence: true
  validates :zip_code,              presence: true

  def self.trips_with_wind_speed(min, max)
    joins(:trips)
    .where("mean_wind_speed_mph >= ? AND mean_wind_speed_mph <= ?", min, max)
  end

  def self.average_trips_with_wind_speed(min, max)
    trips = trips_with_wind_speed(min, max).count
    total_days = where("mean_wind_speed_mph >= ? AND mean_wind_speed_mph <= ?", min, max).count
    (trips/total_days).round(2)
  end

  def self.max_trips_with_wind_speed(min, max)
    trips = trips_with_wind_speed(min, max)
    trips.group('start_date')
    .order('count_all DESC')
    .count
    .values
    .first
  end

  def self.min_trips_with_wind_speed(min, max)
    trips = trips_with_wind_speed(min, max)
    trips.group('start_date')
    .order('count_all DESC')
    .count
    .values
    .last
  end

  def self.trips_with_visibility(min, max)
    joins(:trips)
    .where("mean_visibility_miles >= ? AND mean_visibility_miles <= ?", min, max)
  end

  def self.average_trips_with_visibility(min, max)
    trips = trips_with_visibility(min, max).count
    total_days = where("mean_visibility_miles >= ? AND mean_visibility_miles <= ?", min, max).count
    total_days == 0 ? 0 : (trips/total_days).round(2)
  end

  def self.max_trips_with_visibility(min, max)
    trips = trips_with_visibility(min, max)
    trips.group('start_date')
    .order('count_all DESC')
    .count
    .values
    .first
  end

  def self.min_trips_with_visibility(min, max)
    trips = trips_with_visibility(min, max)
    trips.group('start_date')
    .order('count_all DESC')
    .count
    .values
    .last
  end


end
