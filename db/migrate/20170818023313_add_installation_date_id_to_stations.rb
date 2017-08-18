class AddInstallationDateIdToStations < ActiveRecord::Migration[5.1]
  def change
     add_column :stations, :installation_date_id, :integer
  end
end
