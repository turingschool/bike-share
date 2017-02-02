require_relative '../../spec_helper'

RSpec.describe "When a user visits /trips/new" do
  it "indicates that the page notifies user they are at add trip page" do
    visit "/trips/new"

    expect(page).to have_content("Add your trip information")
  end

  it "saves the user input for trip information" do
    visit "/trips/new"

    fill_in('trip[duration]', with: "400")
    fill_in('trip[start_date]', with: "02/01/2017")
    fill_in('trip[end_date]', with: "02/01/2017")
    fill_in('trip[start_station_id]', with: 30)
    fill_in('trip[end_station_id]', with: 33)
    fill_in('trip[bike_id]', with: 335)
    fill_in('trip[subscription]', with: "Subscriber")
    fill_in('trip[zipcode]', with: "80602")
    click_button('Add Trip')

    expect(page).to have_content("02/01/2017")
    expect(page).to have_content("80602")
  end
end
