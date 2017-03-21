require_relative '../spec_helper'

RSpec.describe "When a user visits 'new'" do
  it 'they can create a new station' do

    visit '/stations/new'

    fill_in "station[name]", with: "New Station"
    fill_in "station[city]", with: "Denver"
    fill_in "station[dock_count]", with: 12
    fill_in "station[installation_date]", with: Date.parse('8/6/2013')

    click_on "Submit"

    expect( current_path ).to eq('/stations')
    expect(page).to have_content("New Station")
  end
end
