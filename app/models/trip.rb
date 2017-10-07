class Trip < ActiveRecord::Base
    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"

    validates_presence_of :duration,
                          :start_date,
                          :start_station_id,
                          :end_date,
                          :end_station_id,
                          :bike_id,
                          :subscription_type,
                          :zip_code





end
