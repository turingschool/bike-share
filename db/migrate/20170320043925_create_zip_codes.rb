class CreateZipCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
