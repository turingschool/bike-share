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

    # self.starting_station_with_most_rides
    #     start = (where start_station_id: maximum :start_station_id)
    #     start.stations.name
    # end

    Trip.find_by_sql("SELECT COUNT(stations.id) FROM trips INNER JOIN trips.start_station_id ON stations.id") 


    Research SQL/AR query commands
    

    group count DESC first
end