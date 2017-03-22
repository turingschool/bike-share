require_relative "../../spec_helper"

RSpec.describe "as a user deletes an existing station from a single station page" do
  xit "they can see existing station data and delete the station record" do
    station = Station.create(name: "Japantown", dock_count: 15, city_id: 1, installation_date: "2013-08-05")

    # as a user
    # when i visit /stations/:id
    visit "/stations/1"
    # and i see my existing station data on screen
    within(".station-info") do
      expect(page).to have_content("Japantown")
      expect(page).to have_content(15)
      # expect(page).to have_content("San Mateo")
      expect(page).to have_content("2013-08-05")
    end
    # and i click on the 'delete station' button
    # then the station is deleted
    click_on "Delete Station"  # or click_button "Delete station" ??
    # and I am redirected to the stations list where I will
    expect(current_path).to eq("/stations")
    # see my updated station data
    expect(page).to_not have_content(station.name)
  end
end
