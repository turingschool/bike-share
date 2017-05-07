class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.text :name
      t.integer :dock_count
      t.integer :city_id
      t.date :installation_date
      t.integer :longitude
      t.integer :latitude
    end
  end
end
