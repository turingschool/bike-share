class CreateTripConditionsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :conditions, :trips do |t|
      t.index :condition_id
      t.index :trip_id
    end
  end
end
