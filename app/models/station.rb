class Station < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true
  validates :dock_count, presence: true

  def self.station_count
    self.count
  end


end
