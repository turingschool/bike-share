class CreateStations < ActiveRecord::Migration[5.0]
	#what is the 5 on the end? research
  def change
  	create_table   :stations do |t|
  		t.string 	   :name
  		t.integer    :dock_count
  		t.string   	 :city
  		t.date 			 :installation_date
  		# t.timestamps 
  	end
  end
end
