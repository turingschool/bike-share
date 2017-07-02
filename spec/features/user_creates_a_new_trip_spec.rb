RSpec.describe "User creates a trip" do
  it "with valid attributes" do
    # As an unauthenticated user
    # When I visit the new trip form
    visit('/trips/new')
    # And I fill in a information
    fill_in("trip[duration]", with: 30)
    fill_in("trip[start_date]", with: 12)
    fill_in("trip[start_station_id]", with: 34)
    fill_in("trip[end_date]", with: 12)
    fill_in("trip[end_station_id]", with: 5)
    fill_in("trip[bike_id]", with: 12)
    fill_in("trip[subscription_type_id]", with: 1)
    fill_in("trip[zipcode]", with: 90210)
    # And I click submit
    click_button("Create Trip")
    # Then I see the individual jockey page and the jockey's name
    trip = Trip.last
    expect(current_path).to eq("/trips")
    expect(page).to have_content("Duration: 30")
  end
end
