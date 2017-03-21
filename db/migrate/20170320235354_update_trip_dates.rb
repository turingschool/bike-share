class UpdateTripDates < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :start_date
    add_column :trips, :start_date, :datetime
    remove_column :trips, :end_date
    add_column :trips, :end_date, :datetime
  end
end
