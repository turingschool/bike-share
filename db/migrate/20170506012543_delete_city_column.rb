class DeleteCityColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :stations, :city 
  end
end
