class AddColumsBackToTrips < ActiveRecord::Migration[5.0]
    def change
      add_column :trips, :start_station_id, :integer
      add_column :trips, :end_station_id, :integer
      add_column :trips, :bike_id, :integer
      add_column :trips, :conditon_id, :integer
    end
end
