class UpdateCityId < ActiveRecord::Migration[5.0]
  def change
    rename_column :stations, :city, :city_id
  end
end
