RSpec.describe "User can visit" do
	it "condition index" do
		Condition.create(date: "1969/4/20", min_temperature: 30, mean_temperature: 40,
		 								 max_temperature: 50, mean_humidity: 30, mean_visibility: 95,
										 mean_wind_speed: 8, precipitation: 0.1                      )

		visit "/conditions"

		expect(page).to have_content(50)
	end
end
