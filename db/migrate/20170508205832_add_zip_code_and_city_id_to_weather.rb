class AddZipCodeAndCityIdToWeather < ActiveRecord::Migration[5.0]
  def change
		change_table(:weather) do |t|
			t.column :zip_code, :integer
			t.column :city_id, :integer
		end
  end
end
