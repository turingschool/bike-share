class AddMoreSpaceToZipCodeIntegerColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :zip_codes, :zip_code, :bigint
  end
end
