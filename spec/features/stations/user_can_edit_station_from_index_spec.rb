require_relative '../../spec_helper'
RSpec.describe "User pushes button to edit station on station index" do
  it "updates the selected station" do
    Station.create(
                   name: "Golden Gate",
                   dock_count: 15,
                   city: "San Francisco",
                   installation_date: "2/18/2010",
                  )
    visit "/stations"
    click_button('Edit')
    fill_in 'station[name]', with: "Lombard Street"
    click_button('Done Editing!')
    #save_and_open_page
    expect(page).not_to have_content("Golden Gate")
    expect(page).to have_content("Lombard Street")
  end
end