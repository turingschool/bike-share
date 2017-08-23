class CreateTripsConditionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :condition_trips do |t|
      t.integer :condition_id
      t.integer :trip_id
    end
  end
end
