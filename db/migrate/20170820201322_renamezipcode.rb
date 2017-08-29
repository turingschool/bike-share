class Renamezipcode < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :zip_code
    add_column :trips, :zip_code_id, :integer
  end
end
