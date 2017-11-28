class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.text     :name
      t.integer  :count
      t.text     :city
      t.datetime :installation_date
  end
end
