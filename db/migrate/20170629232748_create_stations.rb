class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.text    :name
      t.integer :dock_count
      t.integer :installation_date
      t.integer :city_id
    end
  end
end
