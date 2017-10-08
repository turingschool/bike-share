class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |station|
      station.text    :name
      station.integer :dock_count
      station.text    :city
      station.date    :installation_date
      station.float   :lat
      station.float   :long
    end
  end
end
