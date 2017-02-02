class ChangeConditionIdSpellingInTrips < ActiveRecord::Migration[5.0]
  def change

    rename_column :trips, :conditon_id, :condition_id

  end
end
