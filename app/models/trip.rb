class Trip < ActiveRecord::Base
    has_many :zipcodes
    has_many :stations

    # validates :duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, presence: true
end
