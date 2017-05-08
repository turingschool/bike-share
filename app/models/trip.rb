class Trip < ActiveRecord::Base
  validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true

  belongs_to :start_station, :class_name => "Station"
  belongs_to :end_station, :class_name => "Station"

  def self.get_first_30
    all_trips = Trip.order(:start_date)
    first_30_trips = []
    30.times do |number|
      first_30_trips << all_trips[number] unless all_trips[number].nil?
    end
    first_30_trips
  end
end
