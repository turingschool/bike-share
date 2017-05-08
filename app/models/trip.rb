class Trip < ActiveRecord::Base
  validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true

  has_one :start_station, :foreign_key => "start_station_id", :class_name => "Station"
  has_one :end_station, :foreign_key => "end_station_id", :class_name => "Station"
end
