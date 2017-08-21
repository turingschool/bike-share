class CreateStatus < ActiveRecord::Migration[5.1]
  def change
    create_table  :statuses do |t|
      t.integer   :station_id
      t.integer   :bikes_available
      t.integer   :docks_available
      t.time      :time

      t.timestamps null: false
    end
  end
end
