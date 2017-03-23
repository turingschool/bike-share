class UpdateTripSubscriptionsColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :subscription_type, :subscription_type_id
  end
end
