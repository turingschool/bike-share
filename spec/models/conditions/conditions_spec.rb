RSpec.describe Condition do
	describe "Validataions" do
		it "Can exist with valid attributes" do
			condition = Condition.create(weather_date: "1991/8/14", max_temperature: 50.1,
			 														 min_temperature: 40.1,   mean_temperature: 45.3,
																	 mean_humidity: 20.1,     mean_visibility: 2,
																	 mean_wind_speed: 9,      precipitation: 3.1,
																	 zip_code: 80113                                )
			expect(condition.weather_date).to eq(Date.parse("1991/8/14"))
			expect(condition.max_temperature).to eq(50.1)
			expect(condition.min_temperature).to eq(40.1)
			expect(condition.mean_temperature).to eq(45.3)
			expect(condition.mean_humidity).to eq(20.1)
			expect(condition.mean_visibility).to eq(2)
			expect(condition.mean_wind_speed).to eq(9)
			expect(condition.precipitation).to eq(3.1)
			expect(condition.zip_code).to eq("80113")


		end

	end
end
