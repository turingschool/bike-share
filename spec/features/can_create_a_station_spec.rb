require_relative "../spec_helper"

RSpec.describe "Creating a station" do
  it "Can enter station attributes" do
    # As a user
    # when I visit "/stations/new"
    visit "/stations/new"

    # and I fill in station name
    fill_in "station[name]", with: "SuperStation"

    # and i fill in dock_count
    fill_in "station[dock_count]", with: "15"

    # and i fill in city
    fill_in "station[city]", with: "Denver"

    # and i fill in installation date
    fill_in "station[installation_date]", with: 20150203

    # and i click Create station
    click_on "Create Station!"

    # then i expect to be taken to "/stations"
    expect(current_path).to eq("/stations")

    # and then I expect to see the new station name
    # and then I expect to see the new station attributes under the name
    within(".station_info") do
      expect(page).to have_content("SuperStation")
      expect(page).to have_content("Dock Count: 15")
      expect(page).to have_content("City: Denver")
      expect(page).to have_content("Installation Date: 02-03-2015")
    end

  end
end


# as a user
# when i visit "/horses/new"
# and i fill in a horses name with betty
# and i fill in a horses age with 3
# and i fill in a horses total_winnings with "12"
# and i click "submit"
# then i expect to be taken to "/horses"
# and then I expect to see "betty"..etc
