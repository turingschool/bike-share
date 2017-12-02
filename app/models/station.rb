class Station < ActiveRecord::Base

  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.average_bikes_per_station
    average(:dock_count).to_i
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.with_most_bikes
    where(dock_count: Station.most_bikes)
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.with_fewest_bikes
    where(dock_count: Station.fewest_bikes)
  end

  def self.newest_install_date
    maximum(:installation_date)
  end

  def self.newest_station
    where(installation_date: Station.newest_install_date)
  end

  def self.oldest_install_date
    minimum(:installation_date)
  end

  def self.oldest_station
    where(installation_date: Station.oldest_install_date)
  end

end
