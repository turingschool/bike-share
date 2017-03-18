require_relative "../spec_helper"

RSpec.describe "Creating a station" do
  it "Can enter station attributes" do

    visit "/stations/new"
    fill_in "station[name]", with: "SuperStation"
    fill_in "station[dock_count]", with: "15"
    fill_in "city[name]", with: "Denver"
    fill_in "station[installation_date]", with: 20150203

    click_on "Create Station"

    expect(current_path).to eq("/stations")

    expect(page).to have_content("SuperStation")
    expect(page).to have_content("Dock Count: 15")
    expect(page).to have_content("City: Denver")
    expect(page).to have_content("Installation Date: 2015-02-03")

    expect(current_path).to eq("/stations")
  end
end
