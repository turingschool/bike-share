class ChangeTripDatetimeToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :start_date, :date
    change_column :trips, :end_date, :date
  end
end
