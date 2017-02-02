class FixTablesForTrips < ActiveRecord::Migration[5.0]

    def change
      remove_column :trips, :start_station
      remove_column :trips, :end_station
      remove_column :trips, :trip_bike_id
    end


end
