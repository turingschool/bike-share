class ChangeIntToBigint < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :zip_code, :bigint
  end
end
