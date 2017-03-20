class Trip < ActiveRecord::Base
  belongs_to :station

  validates :duration, presence: true
  validates :start_date, presence: true
  # validates :start_station_name, presence: true
  validates :end_date, presence: true
  # validates :end_station_name, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

end
