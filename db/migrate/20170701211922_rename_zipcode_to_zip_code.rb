class RenameZipcodeToZipCode < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :zipcode, :zip_code
  end
end
