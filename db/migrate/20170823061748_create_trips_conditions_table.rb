class CreateTripsConditionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions_trips do |t|
      t.integer :condition_id
      t.integer :trip_id
    end
  end
end
