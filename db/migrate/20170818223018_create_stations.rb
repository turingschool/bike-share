class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :city_id
      t.integer :dock_count
      t.datetime :installation_date
    end
  end
end
