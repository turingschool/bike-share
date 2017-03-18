require_relative "../spec_helper"

RSpec.describe "as a user deletes an existing station from all stations page" do
  it "they can see existing station data and delete the station record" do
    # as a user
    # when i visit /stations
    visit "/stations"
    # and i see my existing station data on screen
    within(".all-stations-info") do
      expect(page).to have_content("Redwood City Caltrain Station")
      expect(page).to have_content("25")
      expect(page).to have_content("Redwood City")
      expect(page).to have_content("8/15/13")
    end
    # and i click on the 'delete station' button? link on end of line?
    # then the station is deleted
    click_on "Delete station"  # or click_button "Delete station" ??
    # and I am redirected to the updated stations list where I will
    expect(current_path).to eq("/stations")
    # not see the deleted station data any longer
    within(".all-stations-info") do
      expect(page).to has_no_content("Redwood City Caltrain Station")
      expect(page).to has_no_content("25")
      expect(page).to has_no_content("Redwood City")
      expect(page).to has_no_content("8/15/13")
    end
  end
end
