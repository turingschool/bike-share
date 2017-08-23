class RemoveConditionKeyFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :conditions, :trip_id
  end
end
