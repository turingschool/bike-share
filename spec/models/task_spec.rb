RSpec.describe Trip do
	describe "Validations" do
		it "is invalid without all attributes" do 
			t1 = Trip.create(duration: 63, start_date: "8/29/2013 14:13", start_station_name: "South Van Ness at Market", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type: "Subscriber", zip_code: 94127)
			t2 = Trip.create(duration: 63, start_date: "8/29/2013 14:13", end_date: "8/29/2013 14:14", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type: "Subscriber", zip_code: 94127)
			t3 = Trip.create(start_date: "8/29/2013 14:13", start_station_name: "South Van Ness at Market", end_date: "8/29/2013 14:14", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type: "Subscriber", zip_code: 94127)
			t4 = Trip.create(duration: 63, start_date: "8/29/2013 14:13", start_station_name: "South Van Ness at Market", end_station_name: "South Van Ness at Market", bike_id: 520, subscription_type: "Subscriber", zip_code: 94127)

			expect(t1).to_not be_valid
	  	expect(t2).to_not be_valid
    	expect(t3).to_not be_valid
			expect(t4).to_not be_valid
		end
	end
end 
