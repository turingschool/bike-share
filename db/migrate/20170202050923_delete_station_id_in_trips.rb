class DeleteStationIdInTrips < ActiveRecord::Migration[5.0]
  def change

    remove_column :trips, :station_id

  end
end
