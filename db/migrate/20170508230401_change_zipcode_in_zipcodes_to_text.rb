class ChangeZipcodeInZipcodesToText < ActiveRecord::Migration[5.0]
  def change
    change_column :zipcodes, :zipcode, :text
  end
end
