class Trip < ActiveRecord::Base
  has_many :stations

  belongs_to :start_station, class_name: "Station", foreign_key: "start_station_id"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station_id"

	validates :duration, presence: true 
	validates :start_date, presence: true
	validates :start_station, presence: true
	validates :end_date, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

end
