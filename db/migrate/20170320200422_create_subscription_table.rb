class CreateSubscriptionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_table do |t|
      t.integer  :subscription

      t.timestamps(null: false)
    end
  end
end
