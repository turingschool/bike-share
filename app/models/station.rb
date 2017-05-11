require './app/models/trip'

class Station < ActiveRecord::Base
  belongs_to :city
  has_many :trips, :class_name => Trip, foreign_key: 'station_id'

  validates :name, :dock_count, :install_date, presence: true
  validates :dock_count, numericality: { greater_than: 0, only_integer: true }

  def self.average_available_bikes
    average(:dock_count).to_i
  end

  def self.max_available_bikes
    maximum(:dock_count).to_i
  end

  def self.max_bike_station
    order(:dock_count).last.name
  end

  def self.min_available_bikes
    minimum(:dock_count).to_i
  end

  def self.min_bike_station
    order(:dock_count).first.name
  end

  def self.newest_station
    order(:install_date).last.name
  end

  def self.oldest_station
    order(:install_date).first.name
  end

end

