class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.text    :name
      t.integer :dock_count
      t.date    :installation_date
      t.float   :lat
      t.float   :long

      t.timestamps null: false
    end
  end
end
