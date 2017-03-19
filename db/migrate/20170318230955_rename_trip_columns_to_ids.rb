class RenameTripColumnsToIds < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :subscription_type, :subscription_type_id
    rename_column :trips, :zipcode, :zip_code_id
  end
end
