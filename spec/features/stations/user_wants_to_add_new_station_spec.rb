require './spec/spec_helper'

RSpec.describe "user wants to add station" do

  it "visits new station page" do
    visit('/stations/new')

    expect(page).to have_content("Add Station")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Number of Docks")
    expect(page).to have_content("City")
    expect(page).to have_content("Install Date")
  end

  it "adds a station" do
    visit('/stations/new')

      fill_in "station[name]", with: 'Fluppydo'
      fill_in "station[dock_count]", with: 1981
      fill_in "city", with: 'Denver'
      fill_in "station[install_date]", with: '2008/10/21'

      click_button "Add Station"

      expect(page).to have_content("Fluppydo")
      expect(page).to have_content("Denver")
      expect(page).to have_content(1981)
      expect(page).to have_content('2008-10-21')
  end

end