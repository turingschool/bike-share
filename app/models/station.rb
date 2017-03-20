class Station < ActiveRecord::Base
  belongs_to :city
  belongs_to :trip

  validates :name, presence: true, uniqueness: true
  validates :dock_count, :installation_date, presence: true

  def self.total_stations
    Station.count
  end

  def self.list_maker(station)
    station.inject("") do |list, element|
      if element == station.last
        list << element
      else
        list << (element + ", " )
      end
    end
  end

  def self.average_bikes_per_station
    Station.average(:dock_count).round
  end

  def self.most_bikes_available_at_station
    Station.maximum(:dock_count)
  end

  def self.stations_where_the_most_bikes_are_available
    most_bikes_station_names = Station.where(dock_count: (Station.most_bikes_available_at_station))
    most = most_bikes_station_names.pluck(:name)
    list_maker(most)
  end

  def self.fewest_bikes_available_at_station
    Station.minimum(:dock_count)
  end

  def self.stations_where_the_fewest_bikes_are_available
    fewest_bikes_station_names = Station.where(dock_count: (Station.fewest_bikes_available_at_station))
    least = fewest_bikes_station_names.pluck(:name)
    list_maker(least)
  end

  def self.newest_station
    name = Station.where(installation_date: Station.maximum(:installation_date))
    newest = name.pluck(:name)
    list_maker(newest)
  end


  def self.oldest_station
    name = Station.where(installation_date: Station.minimum(:installation_date))
    oldest = name.pluck(:name)
    list_maker(oldest)
  end


end
