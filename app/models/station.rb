class Station < ActiveRecord::Base

  belongs_to :city

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  def self.total
    Station.count
  end

  def self.find_average_docks
    docks = Station.all.reduce(0) do |memo, num|
      memo += num.dock_count
    end

    docks / Station.count
  end

  def self.max_dock_count
    station = Station.all.max_by do |station|
      station.dock_count
    end

    station.dock_count
  end

  def self.stations_with_most_docks
    max_docks = self.max_dock_count

    Station.all.select do |station|
      station.dock_count == max_docks
    end
  end
end
