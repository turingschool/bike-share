class AddStationIdColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :start_station_id, :integer
    add_column :trips, :end_station_id, :integer
  end
end
