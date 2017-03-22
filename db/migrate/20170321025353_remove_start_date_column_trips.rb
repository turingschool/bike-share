class RemoveStartDateColumnTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :start_date, :text, null: false, default: '', index: true

    remove_column :trips, :end_date, :text, null: false, default: '', index: true
  end
end
