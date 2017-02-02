require_relative '../../spec_helper'
RSpec.describe "User inputs station information" do
  it "saves the user input for a station" do
    visit "/stations/new"
    fill_in('station[name]', with: "Mission District")
    fill_in('station[dock_count]', with: 12)
    fill_in('station[city]', with: "San Francisco")
    fill_in('station[installation_date]', with: "12/12/2012")
    click_button('Create!')
    #save_and_open_page
    expect(page).to have_content("Mission District")
    expect(page).to have_content("12/12/2012")
  end
end