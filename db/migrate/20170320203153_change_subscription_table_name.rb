class ChangeSubscriptionTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :subscription_table, :subscriptions
  end
end
