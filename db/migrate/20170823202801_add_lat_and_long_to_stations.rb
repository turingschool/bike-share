class AddLatAndLongToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :lat, :float
    add_column :stations, :long, :float
  end
end
