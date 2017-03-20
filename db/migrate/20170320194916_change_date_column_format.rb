class ChangeDateColumnFormat < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :start_date, :text
    change_column :trips, :end_date, :text
  end
end
