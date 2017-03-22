require_relative '../spec_helper'

RSpec.describe "when a user visits /conditions/:id/edit" do
  it "they can edit that condition page" do
    Condition.create(date: "29/8/2013", max_temp: 75.0, mean_temp: 68.0, min_temp: 61.0, mean_humidity: 70.0, mean_visibility: 10.0, mean_wind: 11.0, precipitation: 0.0)

    visit "conditions/1/edit"
    fill_in "condition[max_temp]", with: 77.0
    click_on "Submit"

    expect(current_path).to eq("/conditions/1")

    expect(page).to have_content("Maximum Temperature: 77.0")
  end
end