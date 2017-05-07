class Trip < ActiveRecord::Base
  belongs_to :zipcode
  belongs_to :station, :foreign_key => :start_station_id
  belongs_to :station, :foreign_key => :end_station_id
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station_id, presence: true
  validates :end_date, presence: true
  validates :end_station_id, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true
end
