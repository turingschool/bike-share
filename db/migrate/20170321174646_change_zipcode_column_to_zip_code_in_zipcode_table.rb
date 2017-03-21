class ChangeZipcodeColumnToZipCodeInZipcodeTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :zipcodes, :zipcode, :zip_code
  end
end
