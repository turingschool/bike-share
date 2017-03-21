class UpdateInstallationStationDateV2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :stations, :installation_date
    add_column :stations, :installation_date, :date
  end
end
