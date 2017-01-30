class UpdateDockName < ActiveRecord::Migration[5.0]
  def change
    rename_column :stations, :doc_count, :dock_count
  end
end
