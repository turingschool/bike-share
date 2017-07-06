class RemoveZipcodeFromWeatherConditions < ActiveRecord::Migration[5.0]
  def change
    remove_column(:weather_conditions, :zipcode)
  end
end
