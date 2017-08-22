RSpec.describe "User can create a new condition" do
	it "When visiting condition index" do

		visit "/conditions"
		click_on('Add a New Condition')
		expect(current_path).to eq("/conditions/new")

		fill_in('weather_date',    with: '1969/4/20')
		fill_in('min_temperature', with: 'Englewood')
		fill_in('max_temperature', with: '2012/1/1' )
		fill_in('mean_temperature',with: "20"       )
		fill_in('mean_humidity',   with: 'Mushroom' )
		fill_in('mean_wind_speed', with: 'Englewood')
		fill_in('mean_visibility', with: '2012/1/1' )
		fill_in('precipitation',   with: "20"       )
		fill_in('zip_code',        with: 80113      )

		click_on('create new condition')
		condition = Condition.all.first
		expect(current_path).to eq("/conditions")

	end
end
