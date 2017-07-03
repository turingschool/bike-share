class IncreaseIntegerLimit < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :id, :integer, limit:8
    change_column :trips, :duration, :integer, limit:8
    change_column :trips, :bike_id, :integer, limit:8
    change_column :trips, :zip_code, :integer, limit:8
  end
end
