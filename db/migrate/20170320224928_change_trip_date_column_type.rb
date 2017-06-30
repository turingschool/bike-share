class ChangeTripDateColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :start_date, :datetime
    change_column :trips, :end_date, :datetime
  end
end
