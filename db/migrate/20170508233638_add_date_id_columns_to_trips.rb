class AddDateIdColumnsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :start_date_id, :integer 
    add_column :trips, :end_date_id, :integer 
  end
end
