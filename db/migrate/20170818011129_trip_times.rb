class TripTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_times do |t|
      t.time :time
    end
  end
end
