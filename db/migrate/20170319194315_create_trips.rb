class CreateTrips < ActiveRecord::Migration[5.0]
  def change
  	  create_table   :trips do |t|
  		t.integer 	   :duration
  		t.date         :start_date
  		t.integer 		 :start_station
  		t.date 				 :end_date
  		t.integer 		 :end_station
  		t.integer			 :bike_id
  		t.string			 :subscription_type
  		t.integer			 :zipcode
      t.timestamps 	 null: false
    end
  end
end