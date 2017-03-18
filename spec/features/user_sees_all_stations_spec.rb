require_relative "../spec_helper"

RSpec.describe "When a user visits '/stations' " do
  it "they see all the bike stations" do
    visit '/stations'

    within('h1') do
      expect(page).to have_content('All Bike Stations')
    end

      expect(page).to have_content("name")
      expect(page).to have_content("dock_count")
      expect(page).to have_content("city")
      expect(page).to have_content("installation_date")
  end
end
