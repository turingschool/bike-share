
class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table   :stations do |t|
      t.text             :name
      t.integer          :dock_count
      t.text             :city
      t.date             :installation_date
    end
    execute "SELECT setval('stations_id_seq', 85)"
  end
end
