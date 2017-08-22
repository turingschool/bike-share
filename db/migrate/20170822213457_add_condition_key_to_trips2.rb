class AddConditionKeyToTrips2 < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :trip_id, :integer
  end
end
