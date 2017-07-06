class AddStationIdColumnToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :station_id, :integer
  end
end
