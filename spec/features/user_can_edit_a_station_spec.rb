require "spec_helper"

RSpec.describe "When a user edits a station '/stations/:id/edit" do
  it "they can edit a station" do
    maimi = Station.create!(
              name: "Miami Bike",
              dock_count: 23,
              city: "Miami",
              installation_date: Date.today,
              lat: 23.23,
              long: 34.32
            )
    visit "/stations/#{maimi.id}/edit"
    fill_in 'station[name]', with: "Denver Bike"
    fill_in 'station[dock_count]', with: 26
    fill_in 'station[city]', with: "Miami"
    fill_in 'station[installation_date]', with: Date.new(2013,12,12)
    click_on "Save Changes"

    expect(page).to have_content("Denver Bike")
  end
end
