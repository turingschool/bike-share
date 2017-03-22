class UpdateSubscriptionTypeIdDataTypeInTripsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :subscription_type_id
    add_column :trips, :subscription_type_id, :integer
  end
end
