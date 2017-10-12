class AddLongAndLatToStationsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :long, :float
    add_column :stations, :lat, :float
  end
end
