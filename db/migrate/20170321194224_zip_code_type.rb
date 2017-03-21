class ZipCodeType < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :zip_code, :string
  end
end
