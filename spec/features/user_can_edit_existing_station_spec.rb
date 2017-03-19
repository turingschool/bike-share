require_relative "../spec_helper"

RSpec.describe "as a user edits an existing station" do
  xit "they can see existing station data and enter replacement data" do
    Station.create(name: "Japantown", dock_count: 15, city_id: 1, installation_date: "2013-08-05")
    # as a user
    # when i visit /stations/:id/edit
    visit "/stations/1/edit"
    # and i see my existing station data on screen
    within(".station-info") do
      expect(page).to have_content("Japantown")
      expect(page).to have_content(15)
      # expect(page).to have_content("San Mateo")
      expect(page).to have_content("2013-08-05")
    end
    # and i fill in the new station name
    fill_in "station[name]", with: "Redwood City Caltrain Station"
    # and i fill in the new station dock count
    fill_in "station[dock_count]", with: "25"
    # and i fill in the new station city
    # fill_in "station[city]", with: "Redwood City"
    # and i fill in the new station installation date
    fill_in "station[installation_date]", with: "2013-08-05"
    # then my new station data is saved in place of the old
    click_on "Update Station"
    # and I am redirected to the stations list where I will
    expect(current_path).to eq("/stations/1")
    # see my updated station data
    within(".station-info") do
      expect(page).to have_content("Redwood City Caltrain Station")
      expect(page).to have_content(25)
      # expect(page).to have_content("Redwood City")
      expect(page).to have_content("2013-08-05")
    end
  end
end
