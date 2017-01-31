class UpdateTripColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :bike_id, :trip_bike_id
  end
end
