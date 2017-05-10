class RenameWeathersConditions < ActiveRecord::Migration[5.0]
  def change
    rename_table :weathers, :conditions
  end
end
