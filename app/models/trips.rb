
class Trip < ActiveRecord::Base

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :end_date,
                        :end_station_name,
                        :bike_id
                        :subscription
end
