class AddInstallationDateIdColumnToStations < ActiveRecord::Migration[5.0]
  def change
    add_column(:stations, :installation_date_id, :integer)
  end
end
