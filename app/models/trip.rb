class Trip < ActiveRecord::Base
  belongs_to :start_station,  class_name: "Station"
  belongs_to :end_station,  class_name: "Station"

  validates :duration,          presence: true
  validates :start_date,        presence: true
  validates :start_station_name,presence: true
  validates :start_station_id,  presence: true
  validates :end_date,          presence: true
  validates :end_station_name,  presence: true
  validates :end_station_id,    presence: true
  validates :bike_id,           presence: true
  validates :subscription_type, presence: true

  def self.sort_trips_by_start_date(page)
    sort_by("start_date").take(page*30).drop((page-1)*30)
  end
end
