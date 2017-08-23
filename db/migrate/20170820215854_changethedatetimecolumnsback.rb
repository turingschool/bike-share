class Changethedatetimecolumnsback < ActiveRecord::Migration[5.1]
  def change
    remove_column :trip_dates, :date
    remove_column :trip_times, :time
    add_column :trip_dates, :date, :date
    add_column :trip_times, :time, :time
  end
end
