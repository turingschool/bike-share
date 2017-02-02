class CreateRelationshipsForTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :start_station
    remove_column :trips, :end_station
    remove_column :trips, :trip_bike_id
  end

  def change
    add_column :trips, :start_station_id
    add_column :trips, :end_station_id
    add_column :trips, :bike_id
    add_column :trips, :conditon_id
  end

  def change
    remove_column :bikes, :csv_bike_id
  end

end
