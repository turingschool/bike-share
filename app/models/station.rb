class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  belongs_to :city

  def self.average_per_station
    Station.average(:dock_count)
  end

  def self.most_bikes_available_at_station
    Station.maximum(:dock_count)
  end

  def self.stations_with_most_bikes
    Station.order(:dock_count).reverse_order
  end

  def self.least_bikes_available_at_station
    Station.minimum(:dock_count)
  end

  def self.stations_with_least_bikes
    Station.order(:dock_count)
  end

  def self.most_recent_installed_station
    Station.order(:installation_date).reverse_order.first
  end

  def self.oldest_station
    Station.order(:installation_date).first
  end

end
