class RemoveForeignKeysFromTripsAndConditions < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :condition_id
  end
end
