class DroppingAndResetingMigrations < ActiveRecord::Migration[5.0]
  def change
    drop_table :cities
    drop_table :date_refs
    drop_table :stations
    drop_table :the_dates
  end
end
