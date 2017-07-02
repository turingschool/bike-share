class ChangeCityNameColumnToCity < ActiveRecord::Migration[5.0]
  def change
    rename_column :cities, :name, :city
  end
end
