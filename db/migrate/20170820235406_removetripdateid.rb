class Removetripdateid < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :trip_date_id
  end
end
