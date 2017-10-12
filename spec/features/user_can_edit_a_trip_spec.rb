require "spec_helper"

RSpec.describe "When a user edits a trip '/trips/:id/new" do
  it "they can edit a trip" do
    trip = Trip.create!(
      duration: 63,
      start_date: DateTime.new(2013,8,28,14,14),
      start_station_name: "Station 1",
      start_station_id: 1,
      end_date: DateTime.new(2013,8,29,14,14),
      end_station_name: "Station 2",
      end_station_id: 2,
      bike_id: 520,
      subscription_type: "Subscriber",
      zip_code: 94127
    )
    visit "/trips/#{trip.id}/edit"
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
    click_on 'Save Changes'

    expect(page).to have_content("Station Better Than 1")
    expect(page).to have_content("120")
    expect(page).to have_content("Customer")
  end
end
