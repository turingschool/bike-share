class CreateWeather < ActiveRecord::Migration[5.0]
  def change
  	create_table :weather do |t|
  		t.date 		 :date
  		t.float  	 :max_temperature
  		t.float    :mean_temperature
  		t.float    :min_temperature
  		t.float	   :mean_humidity
  		t.float    :mean_visibility #miles
  		t.float    :mean_wind_speed #mph
  		t.float		 :precipitation #inches
  	end
  end
end
