class CreateZipcode < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.integer :zipcode, null: false
    end
  end
end
