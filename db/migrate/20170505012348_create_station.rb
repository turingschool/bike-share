class CreateStation < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |table|
      table.text :name
      table.integer :dock_count
      table.text :city
      table.datetime :install_date

      table.timestamps null: false
    end
  end
end
