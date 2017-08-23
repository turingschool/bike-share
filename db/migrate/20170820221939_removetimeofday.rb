class Removetimeofday < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :start_day
    remove_column :trips, :end_day
    remove_column :trips, :start_time
    remove_column :trips, :end_time
    add_column :trips, :trip_date_id, :integer
  end
end
