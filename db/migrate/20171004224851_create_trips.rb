class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer     :duration
      t.date        :start_date
      t.text        :start_station
      t.date        :end_date
      t.text        :end_station
      t.text        :subscription_type
      t.integer     :zip_code
      t.timestamps  null: false
    end
  end
end
