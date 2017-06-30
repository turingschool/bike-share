class AddWeatherConditionIdToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :weather_condition_id, :integer

  end
end
