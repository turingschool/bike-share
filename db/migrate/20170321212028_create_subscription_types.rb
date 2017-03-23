class CreateSubscriptionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_types do |t|
      t.text :type
    end
  end
end
