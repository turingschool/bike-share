class Station < ActiveRecord::Base
  validates :name, :city, :dock_count, :installation_date, presence: true

  def self.station_count
    Station.all.count
  end

  def self.bike_average
    Station.average(:dock_count).to_i
  end

  def self.most_bikes
    Station.order(:dock_count).reverse.first
  end

  def self.top_bikes
    Station.order(:dock_count).reverse[0..2]
  end

  def self.few_bikes
    Station.order(:dock_count).first
  end

  def self.fewest_bikes
    Station.order(:dock_count)[0..2]
  end

  def self.newest_station
        Station.order(:dock_count).last
  end

  def self.oldest_station
    Station.order(:dock_count).first
  end
end
