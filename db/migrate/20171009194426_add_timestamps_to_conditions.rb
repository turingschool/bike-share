class AddTimestampsToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :created_at, :datetime, null: false
    add_column :conditions, :updated_at, :datetime, null: false
  end
end
