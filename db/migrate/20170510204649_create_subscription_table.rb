class CreateSubscriptionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptons do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
