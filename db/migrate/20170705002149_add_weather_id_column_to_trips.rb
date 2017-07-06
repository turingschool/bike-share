class AddWeatherIdColumnToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :weather_id, :integer
  end
end
