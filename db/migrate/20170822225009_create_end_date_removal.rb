class CreateEndDateRemoval < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :end_date_id
    remove_column :trips, :start_date_id
    add_column :trips, :trip_date, :date
    drop_table :end_dates
    drop_table :start_dates
  end
end
