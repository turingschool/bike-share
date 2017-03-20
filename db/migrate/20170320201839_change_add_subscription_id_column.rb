class ChangeAddSubscriptionIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :subscription_id, :integer
  end
end
