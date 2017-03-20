class Trip < ActiveRecord::Base

  belongs_to :bike
  belongs_to :start_station
  belongs_to :end_station
  belongs_to :weather

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
