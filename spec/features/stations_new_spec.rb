require_relative '../spec_helper'

RSpec.describe "when a user visits /stations/new" do
  it "they can create a new station" do
    visit "stations/new"
    fill_in "station[name]", with: "Union Station"
    fill_in "station[dock_count]", with: 12
    fill_in "station[installation_date]", with: "15/5/16"
    fill_in "station[city_id]", with: 1
    click_on "Submit"

    expect(current_path).to eq("/stations")

    within("table") do
      expect(page).to have_content("Union Station")
    end
  end
end
