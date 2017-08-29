class TripDates < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_dates do |t|
      t.date :date
    end
  end
end
