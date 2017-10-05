class AddLatLongToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :lat, :float
    add_column :stations, :lng, :float
  end
end