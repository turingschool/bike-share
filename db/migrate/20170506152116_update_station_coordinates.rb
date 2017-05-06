class UpdateStationCoordinates < ActiveRecord::Migration[5.0]
  def change
    change_column :stations, :longitude, :decimal
    change_column :stations, :latitude, :decimal
  end
end
