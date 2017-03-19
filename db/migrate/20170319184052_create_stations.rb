class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text      :name
      t.integer   :dock_count
      t.text      :city
      t.text      :installation_date
      t.timestamps null: false
    end
  end
end
