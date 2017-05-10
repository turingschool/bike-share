require_relative '../spec_helper'

RSpec.describe "when a user visits the edit page" do
  it "displays an edit form" do
    Condition.create(date: "2013-11-22",
                                 max_temperature: 70,
                                 mean_temperature: 60,
                                 min_temperature: 50,
                                 mean_humidity: 20,
                                 mean_visibility: 2,
                                 mean_wind_speed: 10,
                                 precipitation: 12)

    visit("/conditions/1")
    click_on "Edit"

    expect(current_path).to eq("/conditions/1/edit")
    expect(page).to have_content("change")
    expect(page).to have_content("10mph")
  end
end
