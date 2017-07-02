class ChangeStationDateIdToInstallationDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :stations, :date_id, :installation_date
  end
end
