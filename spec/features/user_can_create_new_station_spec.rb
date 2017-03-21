require_relative '../spec_helper'

RSpec.describe "As a user tries to create a station" do
  it "they can enter station attributes and be redirected to see new content on next page" do
    visit '/stations/new'
    fill_in "station[name]", with: "Denver Station"
    fill_in "station[city]", with: "Denver"
    fill_in "station[dock_count]", with: 49
    fill_in "station[installation_date]", with: "8/5/2016"
    click_on "Submit"

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Denver Station")
    expect(page).to have_content("Denver")
    expect(page).to have_content("49")
    expect(page).to have_content("2016-05-08")
  end
end
