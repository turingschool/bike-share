class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string    :name
      t.integer   :dock_count
      t.string    :city
      t.datetime  :installation_date

      t.timestamps null: false
    end
  end
end
