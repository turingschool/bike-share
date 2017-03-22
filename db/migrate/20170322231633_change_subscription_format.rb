class ChangeSubscriptionFormat < ActiveRecord::Migration[5.0]
  def change
    change_column :subscriptions, :subscription, :text
  end
end
