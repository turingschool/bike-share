class AddTripIdToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :condition_id, :integer
  end
end
