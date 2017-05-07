class CreateZipcode < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.integer :zipcode
    end
  end
end
