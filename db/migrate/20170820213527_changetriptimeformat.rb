class Changetriptimeformat < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :start_day
    remove_column :trips, :end_day
    remove_column :trips, :start_time
    remove_column :trips, :end_time
    add_column :trips, :start_day, :date
    add_column :trips, :end_day, :date
    add_column :trips, :end_time, :time
    add_column :trips, :start_time, :time
  end
end
