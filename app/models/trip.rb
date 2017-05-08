class Trip < ActiveRecord::Base
  belongs_to :start_station
  belongs_to :end_station
  belongs_to :subscription_types

  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type_id, presence: true
end
