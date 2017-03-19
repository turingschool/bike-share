class UpdateCityIdDataTypeInStationsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :stations, :city_id
    add_column :stations, :city_id, :integer
  end
end
