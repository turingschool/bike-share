class UpdateColumnOnBikes < ActiveRecord::Migration[5.0]
  def change
    rename_column :bikes, :bike_id, :bike_number
  end
end
