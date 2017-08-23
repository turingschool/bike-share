class CreateSubscriptionTypeTable < ActiveRecord::Migration[5.1]
  def change
    create_table :subscription_types do |t|
      t.text :subscription_type
    end
  end
end
