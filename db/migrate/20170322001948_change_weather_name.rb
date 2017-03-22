class ChangeWeatherName < ActiveRecord::Migration[5.0]
  def change
  	rename_table :weather, :weathers
  end
end
