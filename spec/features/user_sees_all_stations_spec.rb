require_relative "../spec_helper"


RSpec.describe "User sees all stations" do
  it "and has one of the stations and all header names" do
    visit "/stations"
      expect(page).to have_selector('table tr', :minimum => 71)
      expect(page).to have_content("Name")
      expect(page).to have_content("Dock Count")
      expect(page).to have_content("City")
      expect(page).to have_content("Installation Date")
      expect(page).to have_content("San Jose Diridon Caltrain Station")
      expect(page).to have_content("27")
      expect(page).to have_content("San Jose")
      expect(page).to have_content("8/6/2013")
  end
end
