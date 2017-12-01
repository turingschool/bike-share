class Station < ActiveRecord::Base


  def self.station_count
    count
  end

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.max_bikes_per_station
    maximum(:dock_count)
  end

  def self.station_with_most_bikes_available
    find_by(dock_count: maximum(:dock_count)).name
  end

  def self.min_bikes_at_station
    minimum(:dock_count)
  end

  def self.station_with_fewest_available
    find_by(dock_count: minimum(:dock_count)).name
  end

  def self.most_recent_station
    order(installation_date: :DESC).first.name
  end

  def self.oldest_station
    order(installation_date: :DESC).last.name
  end
end
