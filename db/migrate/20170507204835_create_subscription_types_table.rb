class CreateSubscriptionTypesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subscription_types do |t|
      t.string :type
      
      t.timestamps null: false
    end
  end
end
