require_relative "../../spec_helper"

RSpec.describe "when a user visits 'trips/new'" do
  it "they can create a new trip" do

    #when I visit
    visit '/trips/new'

    #and I fill in
    fill_in "trip[duration]", with: "23"
    fill_in "trip[start_station]", with: "Denver"
    fill_in "trip[end_station]", with: "Boulder"
    fill_in "trip[bike_id]", with: "1"
    fill_in "trip[subscription]", with: "Subcriber"
    fill_in "trip[start_date]", with: "8/29/2013 14:14"
    fill_in "trip[end_date]", with: "8/29/2013 14:37"

    #and I click
    click_on("Create Trip")

    #and then I expect
    expect(current_path).to eq("/trips")

    #and then I expect
    expect(page).to have_content("23")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Boulder")
    expect(page).to have_content("1")
    expect(page).to have_content("Subscriber")
    expect(page).to have_content("8/29/2013 14:14")
    expect(page).to have_content("8/29/2013 14:37")

  end
end
