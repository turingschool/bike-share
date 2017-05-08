class AddHumidityColumnToWeather < ActiveRecord::Migration[5.0]
  def change
		change_table :weathers do |t|
			t.column :mean_humidity, :integer
		end
  end
end
