require "spec_helper"

RSpec.describe "When a user adds a new station '/stations/new" do
  it "they can add a station" do
    visit "/stations/new"
    fill_in 'station[name]', with: "Miami Bike"
    fill_in 'station[dock_count]', with: 23
    fill_in 'station[city]', with: "Miami"
    fill_in 'station[installation_date]', with: Date.today
    click_button 'Add New Station'

    expect(page).to have_content("Miami Bike")
  end
end
