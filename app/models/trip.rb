class Trip < ActiveRecord::Base

  belongs_to :bike

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription, presence: true


  def self.find_all_start(id)
    Trip.where(start_station_id: id)
  end

  def self.find_all_end(id)
    Trip.where(start_station_id: id)
  end


end
