class CreateForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :condition_id, :integer
    add_column :conditions, :trip_id, :integer
  end
end
