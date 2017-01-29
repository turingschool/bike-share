class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string      :name
      t.integer     :doc_count
      t.string      :city
      t.string      :installation_date
    end
  end
end
