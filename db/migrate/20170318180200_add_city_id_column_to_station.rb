class AddCityIdColumnToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :city, :city_id
    #, :integer We put in ":city, city_id" instead of :city_id, :integer, WHY??????
  end
end
