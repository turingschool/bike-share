class DropTripsConditionsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :conditions_trips
  end
end
