class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.text    :name
      t.float   :lat
      t.float   :long
      t.integer :dock_count
      t.text    :city
      t.date    :installation_date

      t.timestamps null: false
    end
  end
end
