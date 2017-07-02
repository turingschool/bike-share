class RemoveInstallationDateColumnFromStations < ActiveRecord::Migration[5.0]
  def change
    remove_column(:stations, :installation_date)
  end
end
