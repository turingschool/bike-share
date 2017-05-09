class CreateWeatherTable < ActiveRecord::Migration[5.0]
  def change
		create_table :weather do |t|
			t.datetime :date
			t.integer  :maximum_temperature
			t.integer  :mean_temperature
			t.integer  :minimum_temperature
			t.integer  :mean_visibility
			t.integer  :mean_wind_speed
			t.decimal  :percipitation, precision: 3, scale: 2

			t.timestamps null: false
		end
  end
end
