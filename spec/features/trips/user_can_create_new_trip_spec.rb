require './spec/spec_helper'

RSpec.describe "User can create a trip" do
  it "user can enter trip info to be redirected to new content page" do
    visit '/trips/new'
    fill_in "trip[duration]", with: 60
    fill_in "trip[start_date]", with: "2017/06/15"
    fill_in "trip[start_station_name]", with: "Denver Station"
    fill_in "trip[end_date]", with: "2017/06/15"
    fill_in "trip[end_station_name]", with: "Denver Union"
    fill_in "trip[bike_id]", with: 123
    fill_in "trip[subscription_type[name]", with: "Subscriber"
    fill_in "trip[zip_code]", with: 80202

    click_on "Submit"

    expect(current_path).to eq("/trips")
    expect(page).to have_content("60")
    expect(page).to have_content("2017-06-15")
    expect(page).to have_content("Denver Station")
    expect(page).to have_content("2017-06-15")
    expect(page).to have_content("Denver Union")
    expect(page).to have_content("123")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("80202")
  end
end
