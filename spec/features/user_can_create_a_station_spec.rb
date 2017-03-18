require "./spec/spec_helper"

RSpec.describe "As a user wants to create a station" do 
	it "they can enter station attributes and see it on the page" do
		time = DateTime.now
		visit '/stations/new'
		fill_in "station[name]", with: "Downtown"
		fill_in "station[city]", with: "Amsterdam"
		fill_in "station[dock_count]", with: 15
		fill_in "station[installation_date]", with: time

		click_on "Submit" #explore selectors 

		expect( current_path ).to eq('/stations')
		expect(page).to have_content("Name: Downtown")
		expect(page).to have_content("Dock Count: 15")
		expect(page).to have_content("City: Amsterdam")
		expect(page).to have_content("Installation Date: #{time}")

	end
end