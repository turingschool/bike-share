RSpec.describe "User can create a new station" do
	it "When visiting new station" do

		visit 'stations/new'


		fill_in('name',              with: 'Mushroom' )
		fill_in('city',              with: 'Englewood')
		fill_in('installation_date', with: '2012/1/1' )
		fill_in('dock_count',        with: 20         )


		click_on('create new station')
		save_and_open_page

		expect(Station.count).to eq(1)
		expect(page).to have_content("Mushroom")
		expect(current_path).to eq("/stations")
	end
end
