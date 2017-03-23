class FixTypeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :subscription_types, :type, :flavor
  end
end
