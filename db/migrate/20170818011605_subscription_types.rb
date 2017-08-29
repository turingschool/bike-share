class SubscriptionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscription_types do |t|
      t.string :subscription_type
    end
  end
end
