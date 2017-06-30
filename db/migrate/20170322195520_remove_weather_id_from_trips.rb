class RemoveWeatherIdFromTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :weather_id, :integer
  end
end
