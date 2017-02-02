class AddStartAndEndNameToTrips < ActiveRecord::Migration[5.0]
  def change

    add_column :trips, :start_station_name, :string
    add_column :trips, :end_station_name, :string

  end
end
