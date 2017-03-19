class ChangeColumnNameTrips < ActiveRecord::Migration[5.0]
  def change
  	rename_column :trips, :start_station, :start_station_id
  	rename_column :trips, :end_station, :end_station_id

  end
end
