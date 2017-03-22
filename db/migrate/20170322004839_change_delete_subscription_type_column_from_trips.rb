class ChangeDeleteSubscriptionTypeColumnFromTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column(:trips, :subscription_type)
  end
end
