class Trip < ActiveRecord::Base

  belongs_to :bike
  belongs_to :weather

  has_one :start_station, foreign_key: 'start_station_id', class_name: 'Station'
  has_one :end_station, foreign_key: 'end_station_id', class_name: 'Station'

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :subscription_type, presence: true
end

#add trip-dashboard methods and trip dashboard file later
