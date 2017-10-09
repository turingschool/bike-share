class Station < ActiveRecord::Base
  
  has_many :trips

  validates :name,              presence: true, uniqueness: true
  validates :dock_count,        presence: true
  validates :city,              presence: true
  validates :installation_date, presence: true
  validates :lat,               presence: true
  validates :long,              presence: true

  scope :newest, -> { where(installation_date: maximum("installation_date")) }
  scope :highest, -> { where(dock_count: maximum("dock_count")) }
  scope :lowest, -> { where(dock_count: minimum("dock_count")) }
  scope :oldest, -> { where(installation_date: minimum("installation_date")) }

  def self.station_count
    count
  end

  def self.average_bikes_per_stations
    average("dock_count").floor
  end
end
