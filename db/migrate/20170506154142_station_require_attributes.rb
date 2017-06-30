class StationRequireAttributes < ActiveRecord::Migration[5.0]
  def change
    change_column :stations, :name, :text, null: false
    change_column :stations, :dock_count, :integer, null: false
    change_column :stations, :city_id, :integer, null: false
    change_column :stations, :installation_date, :date, null: false
    change_column :stations, :longitude, :decimal, null: false
    change_column :stations, :latitude, :decimal, null: false
  end
end
