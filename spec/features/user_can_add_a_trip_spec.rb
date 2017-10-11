require "spec_helper"

RSpec.describe "When a user adds a new trip '/trips/new" do
  it "they can add a trip" do
    visit "/trips/new"
    fill_in 'trip[duration]',           with: 54
    fill_in 'trip[start_date]',         with: DateTime.new(2013,8,28,14,14)
    fill_in 'trip[start_station_name]', with: "Station Better Than 1"
    fill_in 'trip[start_station_id]',   with: 1
    fill_in 'trip[end_date]',           with: DateTime.new(2013,8,29,14,14)
    fill_in 'trip[end_station_name]',   with: "Station Better Than 2"
    fill_in 'trip[end_station_id]',     with: 2
    fill_in 'trip[bike_id]',            with: 120
    fill_in 'trip[subscription_type]',  with: "Customer"
    fill_in 'trip[zip_code]',           with: 54401
    click_on 'Add New Trip'

    expect(page).to have_content("Trips Taken")
    expect(page).to have_content("08/28/2013")
  end
end
