class ChangePrimaryKeyToBigintOnTrips < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :id, :bigint
  end
end
