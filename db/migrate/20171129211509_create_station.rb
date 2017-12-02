class CreateStation < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string  :name
      t.integer :dock_count
      t.string  :city
      t.date    :installation_date
    end
  end
end
