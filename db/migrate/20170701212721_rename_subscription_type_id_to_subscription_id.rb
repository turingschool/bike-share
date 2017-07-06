class RenameSubscriptionTypeIdToSubscriptionId < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :subscription_type_id, :subscription_id
  end
end
