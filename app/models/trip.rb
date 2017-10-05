class Trip < ActiveRecord::Base
    belongs_to :start_station, class_name: "Station"
    belongs_to :end_station,   class_name: "Station"

    validates_presence_of :duration,
                          :start_date,
                          :start_station,
                          :end_date,
                          :end_station,
                          :bike_id,
                          :subscription_type,
                          :zip_code





end
