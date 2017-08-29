class ZipCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :zip_codes do |t|
      t.integer :zip_code
    end 
  end
end
