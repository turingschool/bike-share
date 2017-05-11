class AddTypesToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    rename_table :subscriptons, :subscription_types
  end
end
