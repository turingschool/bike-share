class CreateEndStation < ActiveRecord::Migration[5.0]
  def change
    create_table :end_stations do |t|
      t.integer :station_id
      
      t.timestamps null: false
    end
  end
end
