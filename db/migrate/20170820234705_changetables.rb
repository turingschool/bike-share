class Changetables < ActiveRecord::Migration[5.1]
  def change
    create_table :start_dates do |t|
      t.date :date
    end
    create_table :end_dates do |t|
      t.date :date
    end
    drop_table :trip_dates
    drop_table :trip_times
  end
end
