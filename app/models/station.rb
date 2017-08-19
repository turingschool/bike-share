class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true
  validates :dock_count, presence: true

  def self.station_count
    self.count
  end

  def self.most_recent_installation_date
    self.maximum(:installation_date)
  end

  def self.oldest_installation_date
    self.minimum(:installation_date)
  end

  def self.oldest_station
    self.where(installation_date: oldest_installation_date)
  end

  def self.newest_station
    self.where(installation_date: most_recent_installation_date)
  end

end
