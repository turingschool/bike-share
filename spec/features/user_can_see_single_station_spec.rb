require_relative "../spec_helper"

RSpec.describe "when a user visits '/stations/:id' " do
  it "they can see a single station" do
    # As a user
    # When I visit /station/:id
    visit "/stations/:id"
    # I expect to be on the /station/:id page
    expect(current_path).to eq("/station/:id")
    # I expect to see station information for a single station
    within("h2") do
      expect(page).to have_content("Station Information")
    end
    # I expect to see station name for a single station
    expect(page).to have_content("Name: Japantown")
    # I expect to see station dock count for a single station
    expect(page).to have_content("Dock Count: 15")
    # I expect to see station city for a single station
    expect(page).to have_content("City: San Jose")
    # I expect to see station installation date for a single station
    expect(page).to have_content("Installation Date: 08/05/13")
  end
end
