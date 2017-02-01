class Trip < ActiveRecord::Base

  belongs_to :bike
  has_many :stations

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station, presence: true
  validates :end_date, presence: true
  validates :end_station, presence: true
  validates :trip_bike_id, presence: true
  validates :subscription, presence: true


end
