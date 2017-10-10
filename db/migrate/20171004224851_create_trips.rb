class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table    :trips do |t|
      t.bigint      :duration
      t.date        :start_date
      t.time        :start_time
      t.bigint      :start_station_id
      t.date        :end_date
      t.time        :end_time
      t.bigint      :end_station_id
      t.bigint      :bike_id
      t.text        :subscription_type
      t.bigint      :zip_code
      t.timestamps   null: false
    end
  end
end