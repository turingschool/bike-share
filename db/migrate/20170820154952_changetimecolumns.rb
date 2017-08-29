class Changetimecolumns < ActiveRecord::Migration[5.1]
  def change
     remove_column :trips, :start_date
     remove_column :trips, :end_date
     add_column :trips, :start_day, :integer
     add_column :trips, :end_day, :integer
     add_column :trips, :end_time, :integer
     add_column :trips, :start_time, :integer
  end
end
