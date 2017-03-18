require_relative '../spec_helper'

RSpec.describe "When a user visits 'new'" do
  it 'they can create a new station' do

    Station.create(name: 'Turing Station', dock_count: 12, city: 'Denver', installation_date: Date.parse("8/6/2013"))

    visit '/stations/new'

		fill_in "station[name]", with: "Turing Station"
		fill_in "station[city]", with: "Denver"
		fill_in "station[dock_count]", with: 12
		fill_in "station[installation_date]", with: Date.parse('8/6/2013')

		click_on "Submit" #explore selectors

		expect( current_path ).to eq('/stations/2')
		expect(page).to have_content("Turing Station")
		expect(page).to have_content("Dock Count: 12")
		expect(page).to have_content("City: Denver")
		expect(page).to have_content("Installation Date: #{(Date.parse('8/6/2013'))}")
  end
end
