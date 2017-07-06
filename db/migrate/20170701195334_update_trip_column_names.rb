class UpdateTripColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :start_date_id, :start_date
    rename_column :trips, :end_date_id, :end_date
    remove_column :trips, :subscription_type
    add_column :trips, :subscription_type_id, :integer
  end
end
