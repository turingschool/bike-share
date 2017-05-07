class CreateStation < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.text :name
      t.integer :dock_count
      t.text :city
      t.datetime :install_date

      t.timestamps null: false
    end
  end
end
