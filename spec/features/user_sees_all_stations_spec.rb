require_relative "../spec_helper"


RSpec.describe "User sees all content" do
  it "and has one of the stations and all header names" do
    visit "/stations"
      #expect(page).to have_selector('table tr', :minimum <= 71)
      expect(page).to have_content("Name")
      expect(page).to have_content("Dock Count")
      expect(page).to have_content("City")
      expect(page).to have_content("Installation Date")
      expect(page).to have_content("Denver Station")
      expect(page).to have_content("25")
      expect(page).to have_content("Denver")
      expect(page).to have_content("8/6/2013")
  end

  it "and has a create new station button that links to correct route" do
    visit "/stations"
    click_on "Create New Station"
    # expected_path = "/stations/new"
    expect(current_path).to eq("/stations/new")
    # expect(page).to have_current_path(expected_path)
  end
end
