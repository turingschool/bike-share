class DropJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :condition_trips
  end
end
