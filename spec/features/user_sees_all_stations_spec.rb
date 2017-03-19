require_relative "../spec_helper"


RSpec.describe "User sees all stations" do
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
end
